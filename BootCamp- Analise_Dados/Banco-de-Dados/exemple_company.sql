create schema if not exists company1;


create table company1.employee(
	Fname varchar (15) not null,
	Minit char, 
	Lname varchar (15) not null,
	Ssn char(9) not null,
	Bdate date,
	Address varchar(30),
	Sex char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int not null,
    constraint chk_salary_employee check (Salary > 2000.0),
	constraint pk_employee primary key (Ssn)
);

use company1;

desc employee;
create table departament(
	Dname varchar (15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

-- modificar uma constraint (da drop e depois add) --
alter table departament drop constraint departament_ibfk_1;
alter table departament
		add constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn)
        on update cascade;

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references departament(Dnumber)
);

create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
		Essn char (9) not null,
        Pno int not null,
        Hours decimal (3,1) not null,
        primary key (Essn, Pno),
        foreign key (Essn) references employee(Ssn),
        foreign key (Pno) references project(Pnumber) 
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char, -- F ou M
    Bdate date,
    Relationship varchar (8),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee(Ssn)
 );
 
 select * from information_schema.table_constraints
	where constraint_schema = 'company'
 