with count_vacancy_month AS 
	(
		select extract(month from public_date) as u_month, count(*) as u_count
				from vacancy
				group by extract(month from public_date)
	),
	count_resume_month AS 
	(
			select extract(month from public_date) as u_month, count(*) as u_count
					from resume
					group by extract(month from public_date)
	)
select t1.u_month as "МесяцМаксВакансий", t2.u_month as "МесяцМаксРезюме"
from
			(select u_month
				from count_vacancy_month
				where u_count = (select max(u_count) from count_vacancy_month)) as t1,
			(select u_month
				from count_resume_month
				where u_count = (select max(u_count) from count_resume_month)) as t2