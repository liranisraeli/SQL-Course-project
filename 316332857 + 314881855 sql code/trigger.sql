USE VaccinesC19;

#1
DELIMITER $$
create trigger trigger_after_insert
after insert ON vaccines for each row
BEGIN
update nurse 
set numOfVaccinceInjected = numOfVaccinceInjected+1
where employeeID = new.employeeID;
END$$
DELIMITER ;

/*drop trigger trigger_after_insert;*/

/*exaple for update nurse table  */
insert into vaccines(serialNumber,HMO_number,supplierId,citizenId,employeeID)
values
(336,1,1,316217188,219383922);
select *
from nurse;




#2
DELIMITER $$
CREATE TRIGGER before_citizen_update
BEFORE UPDATE
ON citizen FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = 'The age is not valid, the vaccine is allowed from age 16';
                        
    IF new.cBirthDate  >= '2005-01-01' THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$
 
DELIMITER ;


/*drop trigger before_citizen_update;*/


/*Example that the trigger does not allow to update getvaccinedN1 for a citizen that his/hers age less than 16*/

UPDATE citizen
SET getVaccinedN1 = 1
WHERE citizen.cID =318292353;

select *
from citizen;

#3

DELIMITER $$
CREATE TRIGGER before_appoitment_citizens_update
BEFORE UPDATE
ON appoitment FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new appoitment ',
                        NEW.secondDoseDate,
                        ' is not valid , because is before the first appoitment');
                        
    IF new.secondDoseDate < new.firstDoseDate THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$
DELIMITER ;

/*Example that the trigger does not allow to update the second dose date if is before the first appoitment*/

UPDATE appoitment
SET secondDoseDate = '2021-01-20'
WHERE citizenID = 312892835;



