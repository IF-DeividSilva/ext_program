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