const Pool = require('pg').Pool;
const cron = require('node-cron');
const fetch = require('node-fetch');
const getPrices = require('./getNewPrices');

//const pool = new Pool({
//  user: 'postgres',
//  password: 'Q2werty',
//  host: 'localhost',
//  database: 'smarthome',
//  port: '5432'
//});

const LATEST_PRICES_ENDPOINT = 'https://api.porssisahko.net/v1/latest-prices.json';

const sqlClause = 'INSERT INTO public.hourly_price (timeslot, price) VALUES ($1, $2) RETURNING *';
async function fetchLatestPriceData() {
  const response = await fetch(LATEST_PRICES_ENDPOINT);

  return response.json();
}

function getPriceForDate(date, prices) {
  const matchingPriceEntry = prices.find(
    (price) => new Date(price.startDate) <= date && new Date(price.endDate) > date
  );

  if (!matchingPriceEntry) {
    throw 'Price for the requested date is missing';
  }

  return matchingPriceEntry.price;
}

// Note that it's enough to call fetchLatestPriceData() once in 12 hours
const { prices } = await fetchLatestPriceData();

try {
  const now = new Date();
  const price = getPriceForDate(now, prices);
  cron.schedule('1-5 * * * * *', () => {
    console.log(`Hinta nyt (${now.toISOString()}): ${price} snt / kWh (sis. alv)`);
  })}
  catch (e) {
    console.error(`Hinnan haku epäonnistui, syy: ${e}`);
}


