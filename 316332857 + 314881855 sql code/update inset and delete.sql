USE VaccinesC19;

#1 */update*/
update citizen
set getVaccinedN1=1
where cID = 316217188;

select *
from citizen;

#2 */delete*/
delete from nurse
where employeeID = 315855582;

select *
from nurse;


#3 */insert*/
insert into supplier (sID,sName,sAddress,sPhoneNumber)
values
(2,'Moderna','300 E St,NEW YORK,NY',37746666)
;
select *
from supplier;

#4  
insert into HMO(hNumber,name,phoneNumber,address)
values
(2,'Clalit',037304999,'shayke Dan Yeruham')
;

select *
from hmo;

#5 */update*/

update ephonenumbers
set ephonenumber = 0506451999
where employeeID = 316332899;

select*
from ephonenumbers;


