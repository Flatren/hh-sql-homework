select id_area, avg(compensation_from) as avg_com_from, avg(compensation_to) as avg_com_to, avg(compensation_from+compensation_to)/2 as avg_all  
	from vacancy
	group by id_area
	order by id_area
