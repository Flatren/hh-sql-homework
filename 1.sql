create table specialization(
	id serial PRIMARY KEY,
	title text
)

create table vacancy(
	id serial PRIMARY KEY,
	title text,
	id_spec int REFERENCES specialization (id),
	id_area int,
	compensation_from int,
	compensation_to int,
	public_date date 
)

create table resume(
	id serial PRIMARY KEY,
	id_person int,
	description text,
	id_spec int REFERENCES specialization (id),
	public_date date 
)

create table response(
	id serial  PRIMARY KEY,
	id_vacancy int REFERENCES vacancy(id),
	id_resume int REFERENCES resume(id),
	click_date date
)

drop table specialization;
drop table vacancy;
drop table resume;
drop table response;