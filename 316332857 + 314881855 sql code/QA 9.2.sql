USE VaccinesC19;

#1 Number of citizen who took the first dose of vaccine
select sum(citizen.getVaccinedN1 = 1) as Number_Of_Citizens_Get_First_Vaccine
from citizen ;

#2 Number of citizen who took the second dose of vaccine
select sum(citizen.getVaccinedN2 = 1) as Number_Of_Citizens_Get_Second_Vaccine
from citizen ;

#3 The number of citizen who didn't get vaccine at all(yet)
select sum(citizen.getVaccinedN1 = 0) as Number_Of_Citizens_Didnt_Get_Vaccine
from citizen ;

#4 show citizen list from age 60 or older
select citizen.cID,citizen.cFirstName,citizen.cLastName
from citizen
where citizen.cBirthDate <= '1961-01-01';

#5 show appoitment list of a specific date for first dose date
select appoitment.citizenID, appoitment.firstDoseTime
from appoitment
where appoitment.firstDoseTime and appoitment.firstDoseDate = '2021-01-30'
group by appoitment.firstDoseTime
;

#6 how many vaccines does were inject by a specific nurse
select vaccines.employeeID ,COUNT(*) as numberOfVaccines
FROM vaccines
group by vaccines.employeeID;

#7 averge of people who got vaccine from the entire city pupulation
select avg( getVaccinedN1) as  avergeCitizenGotVaccinated 
from citizen
where citizen.getVaccinedN1 or (select sum(citizen.getVaccinedN1 = 1) from citizen) ;

#8 how many vaccine were given by the hmo
select  count(*) as countOfVaccines 
from vaccines
where vaccines.HMO_number='1';


#9 the date of the second vaccine dose for a specific citizen
select appoitment.secondDoseDate,appoitment.secondDoseTime
from appoitment
where appoitment.citizenID="316829456";

#10 the nurse that had injected the most vaccine dose
select employee.eFirstName,employee.eLastName,employee.eID
from employee
where employee.eID in (select max(vaccines.employeeID)from vaccines inner join employee ON employee.eID = vaccines.employeeID);
;


#11 how many appoitment were scheduled by specific secretary
select appoitment.employeeID ,COUNT(*) as numberOfAppoitment
FROM appoitment
group by appoitment.employeeID;

#12 the secretary who scheduled the most appoitmnets
select employee.eFirstName,employee.eLastName,employee.eID
from employee
where employee.eID in (select max(appoitment.employeeID)from appoitment inner join employee ON employee.eID = appoitment.employeeID);
;












