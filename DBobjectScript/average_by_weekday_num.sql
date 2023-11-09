CREATE VIEW public.average_by_weekday_num AS
 SELECT EXTRACT(isodow FROM hourly_price.timeslot) AS vpnumero,
    avg(hourly_price.price) AS avg
   FROM public.hourly_price
  GROUP BY (EXTRACT(isodow FROM hourly_price.timeslot))
  ORDER BY (EXTRACT(isodow FROM hourly_price.timeslot));


ALTER TABLE public.average_by_weekday_num OWNER TO postgres;


COMMENT ON VIEW public.average_by_weekday_num IS 'Calculates an average for each weekday using ISO-weekday numbers';

