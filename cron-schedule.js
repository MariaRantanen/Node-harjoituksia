import fetch from 'node-fetch';
import cron from 'node-cron';





cron.schedule('1-5 * * * * *', () => {
  console.log('running every minute to 1 from 5');
},
 {
    scheduled: true,
    timezone: 'Europe/Helsinki'
  });

