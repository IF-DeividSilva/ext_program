show databases;
create database first_example;
use first_example;
CREATE TABLE person(
	person_id smallint unsigned ,
	fname VARCHAR(20),
	lname VARCHAR (20),
	gender ENUM('M', 'F'),
	birth_date DATE,
	street VARCHAR (30),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food VARCHAR(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id)
    references person(person_id)
);

desc favorite_food;
show databases;

select * from information_schema.table_constraints
where constraint_schema = 'first_example';

insert into person values ('1', 'Carol', 'Silva', 'F', '1979-08-21',
							'Rua Discordancia', 'R janeiro', 'RJ', 'BR', '26054-89');

insert into person values ('2', 'Cristiano', 'Ronaldo', 'M', '1979-08-21',
							'Rua Discordancia', 'R janeiro', 'RJ', 'BR', '26054-89'),
                            ('3', 'Matias', 'Ronaldo', 'M', '1989-08-21',
							'Rua Discordancia', 'R janeiro', 'SP', 'BR', '26054-89');
select * from person;

delete from person where person_id=1
					  or  person_id =3;

insert into favorite_food values (1, 'lasanha'),
								(2, 'charras'),
                                (3, 'macarronada');