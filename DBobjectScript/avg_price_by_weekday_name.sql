CREATE VIEW public.avg_price_by_weekday_name AS
 SELECT weekday_lookup.fin_name AS "viikonpäivä",
    weekday_lookup.swe_name AS veckodag,
    weekday_lookup.eng_name AS weekday,
    weekday_lookup.ger_name AS wochentag,
    weekday_lookup.tur_name AS haftaici,
    round((average_by_weekday_num.avg)::numeric, 3) AS keskihinta
   FROM public.weekday_lookup,
    public.average_by_weekday_num
  WHERE ((weekday_lookup.weekday_number)::numeric = average_by_weekday_num.vpnumero)
  ORDER BY average_by_weekday_num.vpnumero;


ALTER TABLE public.avg_price_by_weekday_name OWNER TO postgres;


