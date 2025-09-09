use company;

-- Join Statement
-- Join
select * from employee join works_on;

-- Join - ON --> Inner Join On
select * from employee join works_on on Sss = Essn;
select * from employee join departament on Ssn = Mgr_ssn;

select Fname, Lname, Address
	from(employee join departament on Dno-Dnumber)
	where Dname = 'Research';


select Dname, Dept_create_date, Dlocation
	from departament join dept_locations using (Dnumber);

-- Cross Join -> produto cartesiano

select * from employee cross join dependent;

