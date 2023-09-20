CREATE VIEW public.average_by_year AS
 SELECT EXTRACT(year FROM hourly_price.timeslot) AS vuosi,
    avg(hourly_price.price) AS keskihinta
   FROM public.hourly_price
  GROUP BY (EXTRACT(year FROM hourly_price.timeslot));