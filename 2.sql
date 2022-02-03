--генерация специализаций
insert into specialization (id, title) 
	select 
		generate_series(1,2000) as id,
		md5(random()::text) as title

--генерация резюме
insert into resume (id, id_person, description,id_spec, public_date)
	select 
			generate_series(1,100000) as id,
			round((random()*1000)::int) as id_person,
			md5(random()::text) as description,
			round((random()*1999)::int+1) as id_spec,
			timestamp '2022-01-01 00:00:00' + random() * (timestamp '2022-12-31 23:59:59' - timestamp '2022-01-01 00:00:00') as public_date 

--генерация вакансий
insert into vacancy (id, title, id_spec, id_area, compensation_from, compensation_to, public_date)
	select 
			generate_series(1,10000) as id,
			md5(random()::text) as title,
			round((random()*1999)::int+1) as id_spec,
			round((random()*100)::int+1) as id_area,
			round((random()*1000)::int+1000) as compensation_from,
			round((random()*1000)::int+5000) as compensation_to,
			timestamp '2022-01-01 00:00:00' + random() * (timestamp '2022-12-31 23:59:59' - timestamp '2022-01-01 00:00:00') as public_date 
insert into vacancy (id, title, id_spec, id_area, compensation_from, compensation_to, public_date) values
	(10001, 'SQL', 15, 10, 10, 15,'2022-10-28')
	
--генерация откликов
insert into response (id, id_vacancy, id_resume,click_date)
	select 
			generate_series(1,100000) as id,
			round((random()*9999)::int + 1) as id_vacancy,
			round((random()*99999)::int + 1) as id_resume,
			timestamp '2022-01-01 00:00:00' + random() * (timestamp '2022-12-31 23:59:59' - timestamp '2022-01-01 00:00:00') as public_date
			
insert into response (id, id_vacancy, id_resume, click_date) values
	(100011, 10001, 15,'2022-10-28'),
	(100012, 10001, 16,'2022-10-29'),
	(100013, 10001, 19,'2022-10-30'),
	(100014, 10001, 20,'2022-10-30'),
	(100015, 10001, 30,'2022-10-30'),
	(100016, 10001, 34,'2022-10-30')
