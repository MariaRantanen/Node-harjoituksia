CREATE VIEW public.running_average AS
 SELECT round((avg(hourly_price.price))::numeric, 3) AS keskihinta
   FROM public.hourly_price;
