CREATE VIEW public.monthly_averages_by_year_fin AS
 SELECT average_by_year_and_month.vuosi,
    month_name_lookup.fin_name,
    average_by_year_and_month.keskihinta
   FROM public.average_by_year_and_month,
    public.month_name_lookup
  WHERE (average_by_year_and_month.kuukausi = (month_name_lookup.month_number)::numeric)
  ORDER BY average_by_year_and_month.vuosi, average_by_year_and_month.kuukausi;