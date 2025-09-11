-- subqueries

use company_constrainsts;

select distinct Pnumber from project
	where Pnumber in(
		(select distinct Pno
			from works_on , employee
            where (Essn = Ssn and Lname='Smith')
        )
		or 
		(select Pnumber
			from project, departament employee
			where (Mgr_ssn = Ssn and Lname ='Smith' and Dnum = Dnumber)
        )
		);

select district Essn from works_on
	where (Pno, Hours) in (select Pno,  Hours
							from works_on
                            where Essn = '12345678');

-- Clausulas com exists e unique 

-- Quais employees possuem dependentes ?
select e.Fname, e.Lname from employee as e 
	where exists( select * from dependent as d 
					where e.Ssn = d.Essn and Relationship = 'Son');
                    
-- Empregados que não possuem dependentes 
select e.Fname, e.Lname from employee as e 
	where not exists( select * from dependent as d 
					where e.Ssn = d.Essn);
                    
select eFname, e.Lname from employee as e, departament d
	where (e.Ssn = d.Mgr_ssn) and exists (select * from departament as d where e.Ssn = d.Essn);

select Fname , Lname from employee
	where (select count(*) from dependent where Ssn = Essn) >=2;
    
select district Essn, Pno from works_on where Pno in (1,2,3);

-- 
-- Join com mais de 3 tables
--

select concat(Fname, ' ', Lname) as Complete_name, Dno as DeptNumber, Pname as ProjectName, Pno as ProjectNumber,  Plocation as Location from employee
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Plocation like 'S%'
    order by Pnumber;
    
-- departament, dept_location, employee
select Dnumber, Dname, concat(Fname, ' ', Lname), Salary, round(Salary*0.05,2) as bonus from departament
	inner join dept_locations using(Dnumber)
    inner join employee on Ssn = Mgr_ssn
    group by Dnumber
    having count(*)> 1 ;
   
--
-- Outer Join
--
select * from employee inner join departament on Ssn = Essn;
select * from employee left join departament on Ssn = Essn;
select * from employee left outer join departament on Ssn = Essn;

    