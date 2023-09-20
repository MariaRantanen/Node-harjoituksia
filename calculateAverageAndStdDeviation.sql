SELECT AVG(price) AS hinta, STDDEV(price) AS keskihajonta
	FROM public.hourly_price;
	