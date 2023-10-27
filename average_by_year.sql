CREATE VIEW public.average_by_year AS
 SELECT EXTRACT(year FROM hourly_price.timeslot) AS vuosi,
    avg(hourly_price.price) AS keskihinta
   FROM public.hourly_price
  GROUP BY (EXTRACT(year FROM hourly_price.timeslot));


ALTER TABLE public.average_by_year OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 217
-- Name: VIEW average_by_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW public.average_by_year IS 'Average electricity prices on yearly basis';

