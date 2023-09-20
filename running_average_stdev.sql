CREATE VIEW public.running_average_stdev AS
 SELECT avg(hourly_price.price) AS hinta,
    stddev(hourly_price.price) AS keskihajonta
   FROM public.hourly_price;