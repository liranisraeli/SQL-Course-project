create schema VaccinesC19;
use VaccinesC19;


CREATE TABLE HMO(
hNumber INT primary key NOT NULL,
name varchar(30) NOT NULL,
phoneNumber INT ,
address VARCHAR (30)
)engine = INNODB;

CREATE TABLE Employee(
HMO_number INT NOT NULL,
eID INT primary key NOT NULL,
eFirstName VARCHAR (30) NOT NULL,
eLastName VARCHAR(30) NOT NULL,
foreign key (HMO_number)references HMO(hNumber)
) engine = INNODB;

CREATE TABLE ePhoneNumbers(
employeeID INT NOT NULL,
ePhoneNumber Int,
foreign key (employeeID)references Employee(eID))engine = INNODB;

CREATE TABLE Supplier(
sID INT primary key NOT NULL,
sName VARCHAR(30) NOT NULL,
sAddress VARCHAR(30),
sPhoneNumber INT
)engine = INNODB;

CREATE TABLE Nurse(
employeeID INT primary key NOT NULL,
numOfVaccinceInjected INT default 0,
foreign key(employeeID)references employee(eID)
)engine = INNODB;


CREATE TABLE Secretary(
employeeID INT primary key NOT NULL,
foreign key(employeeID)references employee(eID)
)engine = INNODB;


CREATE TABLE Citizen(
cID INT primary key NOT NULL,
cFirstName varchar(30) NOT NULL,
cLastName varchar(30) NOT NULL,
cBirthDate Date NOT NULL,
cAddress varchar(30),
getVaccinedN1 INT check(getVaccined = 1 or getVaccined =0),
getVaccinedN2 INT check(getVaccined = 1 or getVaccined =0)
)engine = INNODB;

CREATE TABLE Vaccines(
HMO_number INT NOT NULL,
supplierId INT,
citizenId INT NOT NULL,
employeeID INT,
serialNumber INT primary key NOT NULL,
foreign key (HMO_number)references HMO(hNumber),
foreign key (supplierId)references Supplier(sID),
foreign key (citizenId)references Citizen(cID),
foreign key (employeeID)references Nurse(employeeID)
)engine = INNODB;


CREATE TABLE cPhoneNumbers(
cID INT NOT NULL,
cPhoneNumber INT,
foreign key (cID)references Citizen(cID)
)engine = INNODB;


CREATE TABLE Appoitment(
employeeID INT NOT NULL,
citizenID INT primary key NOT NULL,
firstDoseDate Date NOT NULL,
secondDoseDate Date,
firstDoseTime time NOT NULL,
secondDoseTime time,
foreign key (employeeID)references secretary(employeeID),
foreign key (citizenID)references citizen(cID)
)engine = INNODB;


insert into HMO(hNumber,name,phoneNumber,address)
values
(1,'Maccabi',037304889,'Zvi Burshtein Yeruham')
;

insert into employee(HMO_number,eID,eFirstName,eLastName)
values
(1,316332899,'Liran','Israeli'),
(1,316388829,'Sapir','Sherman'),
(1,315282939,'Gili','Ronen'),
(1,315330304,'Noy','Shir'),
(1,219829287,'Reuven','levy'),
(1,219383922,'Hila','lavi'),
(1,218282822,'Idan','Hur'),
(1,315827282,'Rotem','Or'),
(1,218992322,'Moshe','Cohen'),
(1,315855582,'opal','hasson'),
(1,319927282,'Gal','karasenti')
;

insert into ephonenumbers(employeeID,ephonenumber)
values
(316332899,0506451896),
(316388829,0526335189),
(315282939,0544221896),
(315330304,0506451222),
(219829287,0506482792),
(219383922,0528494829),
(218282822,0508273823),
(315827282,0506433333),
(218992322,0506451232),
(315855582,052642836),
(315855582,050333899),
(319927282,052938394)
;

insert into supplier(sID,sName,sAddress,sPhoneNumber)
values
(1,'Pizzer','235 E St,NEW YORK,NY',37743777)
;

insert into Nurse(employeeID)
values
(219383922),
(218282822),
(315827282),
(218992322),
(315855582),
(319927282)
;

insert into secretary(employeeID)
values
(316332899),
(316388829),
(315282939),
(315330304),
(219829287)
;

insert into citizen(cID,cFirstName,cLastName,cBirthDate,cAddress,getVaccinedN1,getVaccinedN2)
values
(315332851, 'Yoav', 'Arviv', '1970-02-01','Yeruham Haal',1,1),
(312892835, 'Shlomit', 'Malka','1955-01-22','Yeruham Haomer',1,0),
(316217188, 'Shoham','Levi', '1996-01-07','Yeruham Haana',0,0),
(316272829, 'Sahar', 'Shir', '1970-01-28','Yeruham Rab',0,0),
(315332859, 'Mika','Israel', '1960-02-10','Yeruham Siv',1,0),
(315332894, 'Mor', 'Karni', '1983-02-15','Yeruham Dizin',1,1),
(318292353, 'Niv', 'Lavi','2020-03-01', 'Yeruham Margat',0,0),
(318298492, 'Dvora', 'Levi', '1982-03-15','Yeruham Aln',0,0),
(316829289, 'Nissan', 'Danin', '1966-04-15','Yeruham Hamer',1,1),
(315262792, 'Dina', 'Lerman','2000-04-21', 'Yeruham Hapaes',0,0),
(316829456, 'May','David', '1958-05-31','Yeruham Hadam',1,0),
(316347896, 'Sarit' ,'Levi', '1980-06-18','Yeruham Hann',0,0),
(315392453, 'Noa',  'Cohen','1963-07-19', 'Yeruham Hhalom',1,0);
;


insert into cphonenumbers(cID,cphonenumber)
values
(315332851,0526441987),
(312892835,0526449007),
(316217188,0509243007),
(316272829,0526478753),
(315332859,0526542332),
(315332894,0526323233),
(318292353,NULL),
(318298492,0523293232),
(316829289,0503939393),
(315262792,0528283393),
(316829456,0502829292),
(316347896,0528484944),
(316347896,0528489864),
(315392453,0503839322);
;

insert into vaccines(serialNumber,HMO_number,supplierId,citizenId,employeeID)
values
(111,1,1,315332851,219383922),
(112,1,1,312892835,219383922),
(113,1,1,315332859,219383922),
(114,1,1,315332894,218282822),
(115,1,1,316829289,218992322),
(116,1,1,316829456,219383922),
(117,1,1,315392453,218282822),
(222,1,1,315332851,219383922),
(223,1,1,315332894,218282822),
(224,1,1,316829289,218992322)
;


insert into appoitment(employeeID,citizenID,firstDoseDate,secondDoseDate,firstDoseTime,secondDoseTime)
values
(316332899,315332851,'2020-01-12','2020-12-22','17:10','08:00'),
(316332899,312892835,'2021-01-30',NULL,'15:00',NULL),
(219829287,316272829,'2021-01-30',NULL,'15:10',NULL),
(316388829,315332859,'2020-12-20','2021-02-20','17:10','15:00'),
(316388829,315332894,'2020-12-20','2021-01-22','08:00','09:00'),
(316388829,315392453,'2021-03-01',NULL,'11:00',NULL),
(315282939,318298492,'2021-12-15','2021-01-30','16:10','16:00'),
(315282939,316829289,'2021-12-10','2021-01-22','08:00','09:30'),
(315330304,315262792,'2021-02-20',NULL,'09:00',NULL),
(315330304,316829456,'2021-01-10','2021-02-10','09:00','08:00')
;