// LIBRARIES AND MODULES
// ---------------------

const Pool = require('pg').Pool; 
const cron = require('node-cron');
const fetch = require('node-fetch');
const getPrices = require('./getNewPrices');

// APP SETTINGS
// ------------

// Create a new pool for Postgres connections
const pool = new Pool({
  user: 'postgres',
  password: 'Q2werty',
  host: 'localhost',
  database: 'smarthome',
  port: '5432'
});

// Use a date variable to keep track of successful data retrievals
let lastFetchedDate = '1.1.2023'; // Initial value, in production use settings file

// Try to run an operation in 5 minute intervals from 3 to 4 PM
cron.schedule('* * * * *', () => {
  try {
    let timestamp = new Date(); // Get the current timestamp
    let dateStr = timestamp.toLocaleDateString(); // Take datepart of the timestamp

    // If the date of last successful fetch is not the current day, fetch data
    if (lastFetchedDate != dateStr) {
      console.log('Started fething price data ');
      getPrices.fetchLatestPriceData().then((json) => {

        //Loop through prices data and pick starDate and price elements
        json.prices.forEach(async (element) => {
          let values = [element.startDate, element.price];

          // Build a SQL clauset to insert values into table
          const sqlClause = 'INSERT INTO public.hourly_price_api (timeslot_2, price_2) VALUES($1, $2) ON CONFLICT DO NOTHING RETURNING *'; 
          // Function for running SQL operations asyncronously
          const runQuery = async () => {
            let resultset = await pool.query(sqlClause, values);
            return resultset;
          }
          // Call queryfunction and echo results to console
          runQuery().then((resultset) => console.log(resultset.rows[0]))
        });
      });
      lastFetchedDate = dateStr; // Set fetch date to current date
      console.log('Fethed at', lastFetchedDate)
    } else {
      console.log('Data has been successfully retrieved earlier today');
    }
  } catch (error) {
    console.log('An error occurred, trying again in 5 minutes until 4 PM');
  }
});