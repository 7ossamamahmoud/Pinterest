---- Pinterest SWE Project ---- Made by: Team: 28
-------------------------START_TABLE_CREATION_INSERTION----------------------------------------  
drop table Pin;
--drop table Sys_User;

CREATE TABLE Pin
(	Pin_Name VARCHAR2(50) NOT NULL, 
  Pin_ID NUMBER NOT NULL, 
  Pin_Date DATE NOT NULL,
	Description VARCHAR2(50), 
	Board_Name VARCHAR2(50) NOT NULL, 
  Board_ID NUMBER NOT NULL,
	User_ID NUMBER NOT NULL );
  drop table Board;
CREATE  TABLE Board 
( Board_Name VARCHAR2(50) NOT NULL, 
	User_ID NUMBER NOT NULL,
	Description VARCHAR2(500), 
  board_ID NUMBER NOT NULL, 
  Category_ID NUMBER NOT NULL);
   
drop table System_Category;

CREATE TABLE System_Category    --Categories that appear to all Users
( Category_ID NUMBER NOT NULL, 
  Category_Name VARCHAR2(50) NOT NULL);
  drop table User_Category;

CREATE TABLE User_Category      -- Categories which are owened by the user
( Category_ID NUMBER NOT NULL, 
  User_ID number NOT NULL);


CREATE TABLE Sys_User
( User_ID number NOT NULL, 
  User_Name Varchar2 (50) NOT NULL,
  User_Email varchar2(100)  NOT NULL,
  User_Password Varchar2(50) NOT NULL);

Insert into Pin (  Pin_Name,Pin_ID,Pin_Date,Description,Board_Name, Board_ID,User_ID) values ('real madrid',1,to_timestamp('1-APR-22 10.00.00.000000000 PM','DD-MON-RR HH.MI.SS.FF PM'),'RMC ','football',1,7);
Insert into Pin (  Pin_Name,Pin_ID,Pin_Date,Description,Board_Name,Board_ID,User_ID) values ('Alahly',2,to_timestamp('1-APR-10 10.00.00.000000000 PM','DD-MON-RR HH.MI.SS.FF PM'),'AHL','handball',2,10);
Insert into Pin (  Pin_Name,Pin_ID,Pin_Date,Description,Board_Name,Board_ID,User_ID) values ('liverball',4,to_timestamp('1-APR-10 10.00.00.000000000 PM','DD-MON-RR HH.MI.SS.FF PM'),'LIV','football',1,8);
Insert into Pin (  Pin_Name,Pin_ID,Pin_Date,Description,Board_Name,Board_ID,User_ID) values ('MCF',5,to_timestamp('1-APR-10 10.00.00.000000000 PM','DD-MON-RR HH.MI.SS.FF PM'),'PEP','basketball',3,9);
Insert into Pin (  Pin_Name,Pin_ID,Pin_Date,Description,Board_Name,Board_ID,User_ID) values ('manchaster united',6,to_timestamp('1-APR-10 10.00.00.000000000 PM','DD-MON-RR HH.MI.SS.FF PM'),'Devils','volleyball',4,11);

insert into board (  Board_Name,User_ID,Description,board_ID,Category_ID) values ('football',1,'football sport',1,3);
insert into board (  Board_Name,User_ID,Description,board_ID,Category_ID) values ('football',2,'football sport',1,3);


insert into board (  Board_Name,User_ID,Description,board_ID,Category_ID) values ('handball',7,'handball sport',2,3);
insert into board (  Board_Name,User_ID,Description,board_ID,Category_ID) values ('basketball',3,'basketball sport',3,3);
insert into board (  Board_Name,User_ID,Description,board_ID,Category_ID) values ('volleyball',4,'volleyball sport',4,3);


Insert into System_Category (Category_ID,Category_Name) values (1,'Movies');
Insert into System_Category (Category_ID,Category_Name) values (2,'Music');
Insert into System_Category (Category_ID,Category_Name) values (3,'sports');
Insert into System_Category (Category_ID,Category_Name) values (4,'Arts');
Insert into System_Category (Category_ID,Category_Name) values (5,'Animals');

Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (1,'Ossama Mahmoud','Os7@gmail.com','123321');
Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (2,'Ahmed Ashraf','ahmed@gmail.com','123123');
Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (3,'Ehab Adel','Hoba@gmail.com','321321');
Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (4,'Ahmed Khaled','Ma''zon@gmail.com','321123');
Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (5,'Hossam Hassan','Hoss@gmail.com','312312');
Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (6,'Doha Abdelfatah','Doha@gmail.com','456654');
Insert into Sys_User (User_ID,User_Name,User_Email,User_Password) values (7,'Shimaa Nasser','Shimaa@gmail.com','654654');


ALTER TABLE Pin
ADD CONSTRAINT Pin_PK PRIMARY KEY (Pin_ID);

ALTER TABLE Board                                 
ADD CONSTRAINT Board_PK PRIMARY KEY (board_ID);

ALTER TABLE System_Category 
ADD CONSTRAINT Category_PK PRIMARY KEY (Category_ID);

ALTER TABLE Sys_User 
ADD CONSTRAINT Sys_User_PK PRIMARY KEY (User_ID);

ALTER TABLE Pin ADD CONSTRAINT Pin_Board_FK FOREIGN KEY (Board_ID)
REFERENCES Board (Board_ID);
    
-- UNUSED PROCED ---
CREATE OR REPLACE PROCEDURE Delete_Pin 
(pinId in number)
AS
BEGIN
Delete from Pin 
where Pin_ID = pinId;
end;

CREATE OR REPLACE PROCEDURE UPDATE_BOARD 
(boardName in VARCHAR2, CategoryId in number, b_description in VARCHAR2)
as
begin
update  Board 
set   Description=b_description , Category_ID= Categoryid 
where Board_Name=boardName;
end;

CREATE OR REPLACE PROCEDURE Retrieve_Categories
(Category_Name out sys_refcursor)
AS
BEGIN
open Category_Name for
SELECT Category_Name
FROM System_Category ;
END;

CREATE OR REPLACE PROCEDURE Retrieve_Categories_IDs 
(category_name in VARCHAR2 ,CategoryID out number)
AS
BEGIN
select Category_ID into CategoryID
from System_Category
where Category_Name= category_name ;
END;

create or replace procedure GetID
(pname in varchar2 , p_id out number)
as 
begin 
select Pin_ID
into p_id
from pin  
where Pin_Name=pname;
end;
create or replace procedure getids
(cid out sys_refcursor)
as
begin
open cid for 
select Pin_ID
from pin
end;

----------------------------------------------------

create or replace procedure Getuserid
(U_id out number)
as
begin 
select max(User_ID)
into U_id
from Sys_User ;
end;
CREATE OR REPLACE PROCEDURE Get_pin_name
(Pin_Name out sys_refcursor)
AS
BEGIN
open Pin_Name for
SELECT Pin_Name
FROM  pin;
END;
