-- explorando os comandos DDL

select now() as Timestamp;

create database if not exists manipulation;
use manipulation;

create table bankAccounts (
	Id_account int auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint indentification_account_constraint UNIQUE (Ag_num, Ac_num)
);

create table bankClient(
	Id_client int auto_increment,
    ClientAccount int,
    CPF varchar(11) not null,
    RG varchar(9) not null,
    Nome varchar(50) not null,
    Endereço varchar(100) not null,
    Renda_mensal float,
    primary key (iD_Client, ClientAccount),
    constraint fk_acconut_client foreign key (ClientAccount) references bankAccounts(Id_account)
    on update cascade
);

create table bankTransations(
	Id_transcation int auto_increment primary key,
    Ocorrencia datetime,
    Status_transaction varchar(20),
    Valor_transferido float,
    Source_account int,
    Destination_account int,
    constraint fk_source_transaction foreign key (Source_account) references
    bankAccounts(id_Account),
    constraint fk_destionation_transaction foreign key (destination_account) references
    bankAccounts(id_Account)
);


-- alter table  --> realiza modificações na table
-- alter table nome_tabela modify column nome_atributo tipo_dados condicao;
-- alter table nome_tabela add constraint nome_constraint condicoes;


 --
-- Expressoes e alias
--
-- selecionando o valor do INSS
select Fname, Lname, Salary, Salary*0.001 from employee;
select Fname, Lname, Salary, Salary*0.001 as INSS from employee;
select Fname, Lname, Salary, round(Salary*0.001,2) as INSS from employee;

-- definir um aumento de salario para os gerentes que trabalham no projeto X

desc work_on;
select * 
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber);
    
select concat(Fname, ' ', Lname) as Complete_name, Salary, Salary*1.1 as increased_salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
    
-- duas casas decimais
select concat(Fname, ' ', Lname) as Complete_name, Salary, round(Salary*1.1,2) as increased_salary
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno=p.Pnumber and p.Pname='ProductX');
    
    
-- recuperando infos dos departamentos presentes em Stanfford
select Dname as Departament_Name, Mgr_ssr as Manager , Address from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stanfford';

-- recuperando todos os gerentes em Stanfford
select Dname as Departament_Name, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stanfford' and Mgr_ssr = e.Ssn;


-- like e between
select * from project;

select concat(Fname, ' ', Lname) Complete_Name, Dname as Department_Name from employee, departament
	where (Dno-Dnumber and Address like '%Houston%');
    
select Fname, Lname from employee where (Salary > 3000 and Salary < 4000);
select Fname, Lname from employee where (Salary between 3000 and  4000);