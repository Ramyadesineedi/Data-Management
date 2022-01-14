--------------------------Drop Tables and Sequences Section----------------------------
--- In this section, we dropped all tables and sequences
------------------------------------------------------------------------------------
DROP TABLE Location_Features_Linking;
DROP TABLE Features;
DROP TABLE Reservation_Details;
DROP TABLE Customer_Payment;
DROP TABLE Room; 
DROP TABLE Location; 
DROP TABLE Reservation; 
DROP TABLE Customer; 


-- Dropping all Sequences
DROP SEQUENCE Customer_ID_seq_n;
DROP SEQUENCE Reservation_ID_seq;
DROP SEQUENCE location_id_seq;
DROP SEQUENCE room_seq;
DROP SEQUENCE Feature_ID_seq;
DROP SEQUENCE invoice_id_seq_n;

--------------------------Create Sequence----------------------------
--- In this section, we created all the sequences 
------------------------------------------------------------------------------------
CREATE SEQUENCE Customer_ID_seq_n
START WITH 100001;

CREATE SEQUENCE Reservation_ID_seq
START WITH 1;

CREATE SEQUENCE invoice_id_seq_n
START WITH 1;

CREATE SEQUENCE location_id_seq
START WITH 1;

CREATE SEQUENCE room_seq
START WITH 1 INCREMENT BY 1
MINVALUE 0 MAXVALUE 1000000;

CREATE SEQUENCE Feature_ID_seq
START WITH 1;

--------------------------Create Table Section----------------------------
---In this section, we created all the tables and link tables required, and
-- added constrains that are mentioned in the problem statement and are necessary.
--- By Ramya Madhuri Desineedi, Bhavana Reddy, Suchit Das, Mohammed Safi, Lucas Fernandez, Brandt Green
------------------------------------------------------------------------------------

-- Customers Table
--- By Ramya Madhuri Desineedi

CREATE TABLE Customer
(
Customer_ID NUMBER DEFAULT Customer_ID_seq_n.NEXTVAL PRIMARY KEY,
First_Name VARCHAR2(50) NOT NULL,
Last_Name VARCHAR2(50) NOT NULL,
Email VARCHAR2(50) NOT NULL,
Phone CHAR(12) NOT NULL,
Address_Line_1 VARCHAR2(100) NOT NULL,
Address_Line_2 VARCHAR2(100) ,
City VARCHAR2(50) NOT NULL,
State CHAR(2) NOT NULL,
Zip CHAR(5) NOT NULL,
Birthdate DATE ,
Stay_Credits_Earned NUMBER DEFAULT 0 NOT NULL,
Stay_Credits_Used NUMBER DEFAULT 0 NOT NULL,


CONSTRAINT customer_Stay_Credits_Used_max CHECK(Stay_Credits_Earned >= Stay_Credits_Used),
CONSTRAINT Email_unq UNIQUE (Email),
CONSTRAINT Email_length_check CHECK( LENGTH(Email) >= 7),
CONSTRAINT check_zip CHECK ( LENGTH (Zip) = 5 ),
CONSTRAINT check_state CHECK ( LENGTH(State) = 2 ),
CONSTRAINT check_phone CHECK ( LENGTH(Phone) = 12 )
);


CREATE TABLE Reservation
(
Reservation_ID NUMBER DEFAULT Reservation_ID_seq.NEXTVAL PRIMARY KEY,
Customer_ID NUMBER NOT NULL,
Confirmation_Nbr CHAR(8) NOT NULL,
Date_Created DATE DEFAULT SYSDATE NOT NULL,
Check_In_Date DATE NOT NULL,
Check_Out_Date DATE,
Status CHAR(1) NOT NULL,
Discount_Code VARCHAR2(50),
Reservation_Total NUMBER NOT NULL,
Customer_Rating VARCHAR2(5),
Notes VARCHAR2(500),

CONSTRAINT reservations_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
CONSTRAINT reservations_Confirmation_Nbr_uq UNIQUE(Confirmation_Nbr),
CONSTRAINT Confirmation_Nbr_length CHECK ( LENGTH(Confirmation_Nbr) = 8 ),
CONSTRAINT Status_ck1 CHECK (Status = 'U' OR Status = 'I' OR Status = 'C' OR Status = 'N' or Status = 'R')
);


-- Customer Payment table
-- By Bhavana Reddy
CREATE TABLE Customer_Payment
(
Payment_ID NUMBER DEFAULT invoice_id_seq_n.NEXTVAL PRIMARY KEY,
Customer_ID NUMBER NOT NULL,
Cardholder_First_Name VARCHAR2(50) NOT NULL,
Cardholder_Mid_Name VARCHAR2(50) ,
Cardholder_Last_Name VARCHAR2(50) NOT NULL,
CardType CHAR(4) ,
CardNumber CHAR(16) ,
Expiration_Date DATE NOT NULL,
CC_ID CHAR(3) ,
Billing_Address VARCHAR2(200) NOT NULL,
Billing_Ciy VARCHAR2(50) NOT NULL,
Billing_State VARCHAR2(50) NOT NULL,
Billing_Zip CHAR(5) NOT NULL,


CONSTRAINT check_ccid_length CHECK ( LENGTH(CC_ID) = 3 ),
CONSTRAINT check_cardnumber_length CHECK (LENGTH(CardNumber) = 16 ),
CONSTRAINT check_cardtype_length CHECK (LENGTH(CardType) = 4 ),
CONSTRAINT CustomerPayment_fk_Customers FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);

CREATE TABLE Location
(
Location_ID NUMBER DEFAULT location_id_seq.NEXTVAL PRIMARY KEY,
Location_Name VARCHAR(20) NOT NULL UNIQUE,
Address VARCHAR2(200) NOT NULL,
City VARCHAR2(50) NOT NULL,
State CHAR(2) NOT NULL,
Zip CHAR(5) NOT NULL,
Phone CHAR(12) NOT NULL,
URL VARCHAR2(200) NOT NULL,

CONSTRAINT location_check_phone CHECK ( LENGTH(Phone) = 12 )


);

-- Room table
-- By Brandt Green

CREATE TABLE Room
(
Room_ID NUMBER DEFAULT room_seq.NEXTVAL PRIMARY KEY,
Location_ID NUMBER NOT NULL,
Floor NUMBER NOT NULL,
Room_Number NUMBER NOT NULL,
Room_Type CHAR(1) NOT NULL,
Square_Footage NUMBER(9,2) DEFAULT 0,
Max_People NUMBER NOT NULL,
Weekday_Rate NUMBER(9,2) DEFAULT 0,
Weekend_Rate NUMBER(9,2) DEFAULT 0,

CONSTRAINT room_fk FOREIGN KEY (Location_ID) REFERENCES Location (Location_ID),
CONSTRAINT room_ck CHECK (Room_Type = 'D' OR Room_Type = 'Q' OR Room_Type = 'K' OR Room_Type = 'S' or Room_Type = 'C') --- To Check if the room type is valid.
);

-- Feature Table
-- By Mohammed Safi



CREATE TABLE Features
(
Feature_ID NUMBER(4) ,
Feature_Name VARCHAR2(100),

CONSTRAINT Feature_ID_pk PRIMARY KEY (Feature_ID),
CONSTRAINT Feature_Name_uq UNIQUE(Feature_Name)
);

-- Location Features Linking table
-- By Mohammed Safi
CREATE TABLE Location_Features_Linking
(
Location_ID NUMBER NOT NULL,
Feature_ID NUMBER NOT NULL,
CONSTRAINT LID_FID_Person PRIMARY KEY (Location_ID,Feature_ID),
CONSTRAINT lid_fk FOREIGN KEY (Location_ID) REFERENCES Location (Location_ID),
CONSTRAINT fid_fk FOREIGN KEY (Feature_ID) REFERENCES Features (Feature_ID)
);
-- Reservation Details table
-- By Mohammed Safi
CREATE TABLE Reservation_Details
(
Reservation_ID NUMBER NOT NULL,
Room_ID NUMBER NOT NULL,
Number_of_Guests NUMBER NOT NULL,
CONSTRAINT RID_ROID_Person PRIMARY KEY (Reservation_ID,Room_ID),
CONSTRAINT rid_fk FOREIGN KEY (Reservation_ID) REFERENCES Reservation (Reservation_ID),
CONSTRAINT roomid_fk FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID)
);

-----------------------------Insert Data Section--------------------------------
--- In this section, we have inserted data into created tables. ---
--- By Ramya Madhuri Desineedi, Bhavana Reddy, Suchit Das, Mohammed Safi, Lucas Fernandez, Brandt Green
--------------------------------------------------------------------------------



-- Insert statements
INSERT INTO Customer
(Customer_ID ,First_Name,Last_Name,Email,Phone,Address_Line_1,Address_Line_2,City,State,Zip, Birthdate,Stay_Credits_Earned,Stay_Credits_Used)
VALUES (Customer_ID_seq_n.NEXTVAL,'Bhavana','Reddy','bc35833@utexas.edu','123-456-7891','1020 E 44th street','','Austin','TX','78701','21-Jun-1995',12,4);
INSERT INTO Customer
(Customer_ID ,First_Name,Last_Name,Email,Phone,Address_Line_1,Address_Line_2,City,State,Zip, Birthdate,Stay_Credits_Earned,Stay_Credits_Used)
VALUES (Customer_ID_seq_n.NEXTVAL,'Suchit','Das','sd38448@utexas.edu','123-256-6861','1802 W Avenue','','Chicago','IL','60631','24-Oct-1994',30,25);
commit;

INSERT INTO Reservation
(Reservation_ID,Customer_ID,Confirmation_Nbr,Date_Created,Check_In_Date,Check_Out_Date,Status,Discount_Code,Reservation_Total,Customer_Rating,Notes)
VALUES (Reservation_ID_seq.NEXTVAL,100001,'AQ1234ZY',DEFAULT,'4-Oct-2021','10-Oct-2021','I','GET25','750','','');
INSERT INTO Reservation
(Reservation_ID,Customer_ID,Confirmation_Nbr,Date_Created,Check_In_Date,Check_Out_Date,Status,Discount_Code,Reservation_Total,Customer_Rating,Notes)
VALUES (Reservation_ID_seq.NEXTVAL,100002,'AQ1235ZY',DEFAULT,'21-Sep-2021','29-Sep-2021','C','GET30','1608','4','');
INSERT INTO Reservation
(Reservation_ID,Customer_ID,Confirmation_Nbr,Date_Created,Check_In_Date,Check_Out_Date,Status,Discount_Code,Reservation_Total,Customer_Rating,Notes)
VALUES (Reservation_ID_seq.NEXTVAL,100002,'AQ1236ZY',DEFAULT,'18-Aug-2021','20-Aug-2021','C','','201','5','Good Staff. Good Stay. Enjoyed');
commit;

INSERT INTO Customer_Payment
(Payment_ID,Customer_ID,Cardholder_First_Name,Cardholder_Mid_Name,Cardholder_Last_Name,CardType,CardNumber,Expiration_Date,CC_ID,Billing_Address,Billing_Ciy,Billing_State,Billing_Zip)
VALUES (invoice_id_seq_n.NEXTVAL,100001,'Bhavana','C','Reddy','VISA','9600123434345252','6-Dec-2023','647','1020 E 44 Street','Austin','TX','78701');
INSERT INTO Customer_Payment
(Payment_ID,Customer_ID,Cardholder_First_Name,Cardholder_Mid_Name,Cardholder_Last_Name,CardType,CardNumber,Expiration_Date,CC_ID,Billing_Address,Billing_Ciy,Billing_State,Billing_Zip)
VALUES (invoice_id_seq_n.NEXTVAL,100002,'Suchit','Kumar','Das','MSTC','5200122268004555','19-Jul-2025','549','1802 W Avenue','Chicago','IL','60631');
commit;

INSERT INTO Location
(Location_ID,Location_Name,Address,City,State,Zip,Phone,URL)
VALUES (location_id_seq.NEXTVAL,'South Congress','SOUTH CONGRESS ADDRESS','Austin','TX','78704','512-736-8668','g.com');
INSERT INTO Location
(Location_ID,Location_Name,Address,City,State,Zip,Phone,URL)
VALUES (location_id_seq.NEXTVAL,'The East 7th Lofts','North CONGRESS ADDRESS','Austin','TX','78704','512-736-8678','gg.com');
INSERT INTO Location
(Location_ID,Location_Name,Address,City,State,Zip,Phone,URL)
VALUES (location_id_seq.NEXTVAL,'Balcones Canyonlands','EAST CONGRESS ADDRESS','Austin','TX','78704','512-736-8868','ggwp.com');
commit;

INSERT INTO Room
(Room_ID,Location_ID,Floor,Room_Number,Room_Type,Square_Footage,Max_People,Weekday_Rate,Weekend_Rate)
VALUES (room_seq.NEXTVAL,1,1,103,'S',3125,4,250,210);
INSERT INTO Room
(Room_ID,Location_ID,Floor,Room_Number,Room_Type,Square_Footage,Max_People,Weekday_Rate,Weekend_Rate)
VALUES (room_seq.NEXTVAL,1,2,220,'D',2000,2,120,100);
INSERT INTO Room
(Room_ID,Location_ID,Floor,Room_Number,Room_Type,Square_Footage,Max_People,Weekday_Rate,Weekend_Rate)
VALUES (room_seq.NEXTVAL,2,1,103,'S',3000,4,275,265);
INSERT INTO Room
(Room_ID,Location_ID,Floor,Room_Number,Room_Type,Square_Footage,Max_People,Weekday_Rate,Weekend_Rate)
VALUES (room_seq.NEXTVAL,2,2,220,'D',2000,2,175,165);
INSERT INTO Room
(Room_ID,Location_ID,Floor,Room_Number,Room_Type,Square_Footage,Max_People,Weekday_Rate,Weekend_Rate)
VALUES (room_seq.NEXTVAL,3,1,103,'S',4000,4,410,395);
INSERT INTO Room
(Room_ID,Location_ID,Floor,Room_Number,Room_Type,Square_Footage,Max_People,Weekday_Rate,Weekend_Rate)
VALUES (room_seq.NEXTVAL,3,2,220,'D',1500,2,310,285);
commit;

INSERT INTO Features
(Feature_ID,Feature_Name)
VALUES (Feature_ID_seq.NEXTVAL,'WI-FI');
INSERT INTO Features
(Feature_ID,Feature_Name)
VALUES (Feature_ID_seq.NEXTVAL,'Fitness Centre');
INSERT INTO Features
(Feature_ID,Feature_Name)
VALUES (Feature_ID_seq.NEXTVAL,'Jacuzzi');
INSERT INTO Features
(Feature_ID,Feature_Name)
VALUES (Feature_ID_seq.NEXTVAL,'Indoor Games');
commit;

INSERT INTO Location_Features_Linking
(Location_ID,Feature_ID)
VALUES (1,1);
INSERT INTO Location_Features_Linking
(Location_ID,Feature_ID)
VALUES (1,2);
INSERT INTO Location_Features_Linking
(Location_ID,Feature_ID)
VALUES (1,3);
INSERT INTO Location_Features_Linking
(Location_ID,Feature_ID)
VALUES (2,4);
INSERT INTO Location_Features_Linking
(Location_ID,Feature_ID)
VALUES (3,3);
INSERT INTO Location_Features_Linking
(Location_ID,Feature_ID)
VALUES (3,4);
commit;

INSERT INTO Reservation_Details
(Reservation_ID,Room_ID,Number_of_Guests)
VALUES (3,4,2);
INSERT INTO Reservation_Details
(Reservation_ID,Room_ID,Number_of_Guests)
VALUES (1,1,3);
INSERT INTO Reservation_Details
(Reservation_ID,Room_ID,Number_of_Guests)
VALUES (2,2,5);
commit;

--------------------------Indexing Section----------------------------
--- In this section, we created all the indexes
------------------------------------------------------------------------------------
CREATE INDEX Reservation_Customer_ID_fk_ix
ON Reservation (Customer_ID);

CREATE INDEX CustomerPayment_Customer_ID_fk_ix
ON Customer_Payment (Customer_ID);

CREATE INDEX Room_Location_ID_fk_ix
ON Room (Location_ID);

---Addition Indexing 
CREATE INDEX Customer_Rating_index
ON Reservation (Customer_Rating);

CREATE INDEX Status_index
ON Reservation (Status);






