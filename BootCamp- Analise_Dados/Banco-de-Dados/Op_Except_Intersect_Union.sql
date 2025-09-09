-- union, except e intersect
create database testes;
use testes;

create table R(
	A char(2)
);

create table S(
	A char(2)
);

insert	into R(A) values ('a1'),('a2'), ('a3'), ('a4');
insert	into S(A) values ('a1'),('a2'), ('a3'), ('a4'), ('a5'), ('a6');

select * from R;
select * from S;

-- except -> not in

select * from S where A not in (select A from R);

-- Intersect
select distinct R.A from R where R.A in (select S.A from S);

-- Union
(select distinct R.A from R) union (select distinct S.A from S);
(select R.A from R) union (select S.A from S);