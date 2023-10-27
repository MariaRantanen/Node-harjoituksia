-- View: public.average_by_year-month_day

-- DROP VIEW public."average_by_year-month_day";

CREATE OR REPLACE VIEW public."average_by_year-month_day"
 AS
 SELECT EXTRACT(year FROM hourly_price.timeslot) AS vuosi,
    EXTRACT(month FROM hourly_price.timeslot) AS kuukausi,
    EXTRACT(day FROM hourly_price.timeslot) AS "päivä",
    avg(hourly_price.price) AS keskihinta
   FROM hourly_price
  GROUP BY (EXTRACT(year FROM hourly_price.timeslot)), (EXTRACT(month FROM hourly_price.timeslot)), (EXTRACT(day FROM hourly_price.timeslot));

ALTER TABLE public."average_by_year-month_day"
    OWNER TO postgres;

