create database PIBD_library;
create table publisher(
Publisher_ID char(10) primary key,
publisher_name varchar(30),
Address varchar(30),
website varchar(30));
insert into pibd_library.publisher(Publisher_ID,Publisher_name,Address,website) values ('123','Penguin random House','Oxford street','www.penguin.com'),
																						('456','HarperCollins','Abbey Road','www.harper.com'),
                                                                                        ('789','Simon','Downding Street','www.simon.com'),
                                                                                        ('101','Hachette Livre','Baker Street','www.livre.com'),
                                                                                        ('102','Macmillan Publishers','Regent Street','www.Macmillan.com'),
                                                                                        ('103','scholastic Corporation','The mall','www.scholastic.com'),
                                                                                        ('104','Pearson Education','Portobello Road','www.pearson.com'),
                                                                                        ('105','Bloomsbury Publishing','High street','www.bloomsbury.com'),
                                                                                        ('106','wiley','Penny Lane','www.wiley.com'),
                                                                                        ('107','Oxford University Press','The Strand','www.oxford.com');
select * from pibd_library.publisher;

create table author(
Author_ID char(10) primary key not null,
author_name varchar(30) not null,
Phone_Number varchar(30) not null,
Email varchar(30) not null);
insert into author (Author_ID, author_name, Phone_Number, Email) values  ('A001', 'John Smith', '081234578923', 'john.smith@yahoo.com'),
																		 ('A002', 'Emily Johnson', '083457812901', 'emily.johnson@yahoo.com'),
																		 ('A003', 'Michael Williams', '085748912309', 'michael.williams@yahoo.com'),
																		 ('A004', 'Sarah Davis', '091236578324', 'sarah.davis@yahoo.com'),
                                                                         ('A005', 'David Brown', '089786546765', 'david.brown@yahoo.com'),
																		 ('A006', 'Jennifer Wilson', '089743243212', 'jennifer.wilson@eyahoo.com'),
																		 ('A007', 'Robert Taylor', '087865412321', 'robert.taylor@yahoo.com'),
																		 ('A008', 'Jessica Anderson', '087865431234', 'jessica.anderson@yahoo.com'),
																		 ('A009', 'Daniel Miller', '08796543213', 'daniel.miller@yahoo.com'),
																		 ('A010', 'Sophia Turner', '08786543453', 'sophia.turner@yahoo.com');
   
select*from pibd_library.author;

create table book(
Book_ID char(10) not null,
Title varchar(30) not null,
primary key(Book_ID,Title),
Publisher_ID char(10) not null,
Author_ID char(10) not null,
foreign key(Publisher_ID) references publisher(Publisher_ID),
foreign key (Author_Id) references author(Author_Id),
Genre varchar(30) not null );
INSERT INTO book (Book_ID, Title, Publisher_ID, Author_ID, Genre)
VALUES
    ('B001', 'Book 1', '123', 'A001', 'Fiction'),
    ('B002', 'Book 2', '456', 'A002', 'Mystery'),
    ('B003', 'Book 3', '789', 'A003', 'Fantasy'),
    ('B004', 'Book 4', '101', 'A004', 'Romance'),
    ('B005', 'Book 5', '102', 'A005', 'Science Fiction'),
    ('B006', 'Book 6', '103', 'A006', 'Thriller'),
    ('B007', 'Book 7', '104', 'A007', 'Non-fiction'),
    ('B008', 'Book 8', '105', 'A008', 'Historical Fiction'),
    ('B009', 'Book 9', '106', 'A009', 'Biography'),
    ('B010', 'Book 10', '107', 'A010', 'Adventure');

select * from pibd_library.book;

create table written_by(
Author_code char(5) not null,
Publication_year char(5) not null,
Author_ID char(10) not null,
Book_ID char(10) not null,
Authors_Role varchar(30),
foreign key(Author_ID)references author(Author_ID),
foreign key(Book_ID)references book(Book_ID),
primary key(Author_code,Publication_year));
INSERT INTO written_by (Author_code, Publication_year, Author_ID, Book_ID, Authors_Role)
VALUES
    ('A001', '2020', 'A001', 'B001', 'Author'),
    ('A002', '2021', 'A002 ', 'B002', 'Editor'),
    ('A003', '2022', 'A003', 'B003', 'Translator'),
    ('A004', '2020', 'A004', 'B004', 'Author'),
    ('A005', '2021', 'A005', 'B005', 'Author'),
    ('A006', '2022', 'A006', 'B006', 'Editor'),
    ('A007', '2020', 'A007', 'B007', 'Author'),
    ('A008', '2021', 'A008', 'B008', 'Editor'),
    ('A009', '2022', 'A009', 'B009', 'Author'),
    ('A010', '2020', 'A010', 'B010', 'Editor');

select * from pibd_library.written_by;

create table borrowing(
Borrowing_ID char(10) not null,
Date_Borrowed date not null,
primary key(Borrowing_ID,Date_Borrowed),
DateBorrowed date not null,
Member_ID char(10) not null,
Book_ID char(10) not null,
foreign key(DateBorrowed) references dateBorrowedT(Date_Borrowed),
foreign key(Member_ID) references member(Member_ID),
foreign key(Book_ID) references book(Book_ID));
INSERT INTO borrowing (Borrowing_ID, Date_Borrowed, DateBorrowed, Member_ID, Book_ID) VALUES
  ('BOR001', '2023-01-01', '2023-01-01', 'MEM001', 'B001'),
  ('BOR002', '2023-02-05', '2023-02-05', 'MEM002', 'B002'),
  ('BOR003', '2023-03-10', '2023-03-10', 'MEM003', 'B003'),
  ('BOR004', '2023-04-15', '2023-04-15', 'MEM004', 'B004'),
  ('BOR005', '2023-05-20', '2023-05-20', 'MEM005', 'B005'),
  ('BOR006', '2023-06-25', '2023-06-25', 'MEM006', 'B006'),
  ('BOR007', '2023-07-30', '2023-07-30', 'MEM007', 'B007'),
  ('BOR008', '2023-08-31', '2023-08-31', 'MEM008', 'B008'),
  ('BOR009', '2023-09-05', '2023-09-05', 'MEM009', 'B009'),
  ('BOR010', '2023-10-10', '2023-10-10', 'MEM010', 'B010');
  
  select * from pibd_library.borrowing;

create table dateBorrowedT(
Date_Borrowed date not null,
primary key(Date_Borrowed),
Date_Returned date not null);
INSERT INTO dateBorrowedT (Date_Borrowed, Date_Returned)
VALUES 
  ('2023-01-01', '2023-01-07'),
  ('2023-02-05', '2023-02-12'),
  ('2023-03-10', '2023-03-17'),
  ('2023-04-15', '2023-04-22'),
  ('2023-05-20', '2023-05-27'),
  ('2023-06-25', '2023-07-02'),
  ('2023-07-30', '2023-08-17'),
  ('2023-08-31', '2023-09-08'),
  ('2023-09-05', '2023-10-22'),
  ('2023-10-10', '2023-11-27');
select * from pibd_library.dateBorrowedT;

create table penalty(
Penalty_ID char(10),
Penalty_Date date,
primary key(Penalty_ID,Penalty_Date),
Penalty_Date_FK date,
Payment_Date_FK date,
foreign key(Penalty_Date_Fk) references penaltyDateT(Penalty_Date),
foreign key(Payment_Date_FK) references paymentDateT(Payment_Date));
INSERT INTO penalty (Penalty_ID, Penalty_Date, Penalty_Date_FK, Payment_Date_FK) VALUES
  ('PEN001', '2023-01-01', '2023-01-01', '2023-01-15'),
  ('PEN002', '2023-02-05', '2023-02-05', '2023-02-20'),
  ('PEN003', '2023-03-10', '2023-03-10', '2023-03-25'),
  ('PEN004', '2023-04-15', '2023-04-15', '2023-04-30'),
  ('PEN005', '2023-05-20', '2023-05-20', '2023-05-31'),
  ('PEN006', '2023-06-25', '2023-06-25', '2023-06-30'),
  ('PEN007', '2023-07-30', '2023-07-30', '2023-07-31'),
  ('PEN008', '2023-08-31', '2023-08-31', '2023-08-31'),
  ('PEN009', '2023-09-05', '2023-09-05', '2023-09-15'),
  ('PEN010', '2023-10-10', '2023-10-10', '2023-10-30');

select * from pibd_library.penalty;

create table penaltyDateT(
Penalty_Date date,
primary key(Penalty_date),
Penalty_Fee float);
INSERT INTO penaltyDateT (Penalty_Date, Penalty_Fee) VALUES
  ('2023-01-01', 10000),
  ('2023-02-05', 12000),
  ('2023-03-10', 5000),
  ('2023-04-15', 20000),
  ('2023-05-20', 5000),
  ('2023-06-25', 25000),
  ('2023-07-30', 15000),
  ('2023-08-31', 20000),
  ('2023-09-05', 8000),
  ('2023-10-10', 12000);

select * from pibd_library.penaltyDateT;

create table paymentDateT(
Payment_Date date,
primary key(Payment_Date),
Penalty_Status char(10));
INSERT INTO paymentDateT (Payment_Date, Penalty_Status) VALUES
  ('2023-01-15', 'Paid'),
  ('2023-02-20', 'Paid'),
  ('2023-03-25', 'Unpaid'),
  ('2023-04-30', 'Paid'),
  ('2023-05-31', 'Unpaid'),
  ('2023-06-30', 'Paid'),
  ('2023-07-31', 'Paid'),
  ('2023-08-31', 'Unpaid'),
  ('2023-09-15', 'Paid'),
  ('2023-10-30', 'Unpaid');

select * from pibd_library.paymentDateT;

create table member(
Member_ID char(10) not null,
Address varchar(30) not null,
primary key(Member_ID,Address),
Book_ID char(10) not null,
foreign key(Book_ID) references book(Book_ID),
Member_Name varchar(30) not null,
Phone_Number varchar(30) not null,
Email varchar(30) not null);
INSERT INTO member (Member_ID, Address, Book_ID, Member_Name, Phone_Number, Email)
VALUES
  ('MEM001', '123 Main Street', 'B001', 'John Doe', 1234567890, 'johndoe@example.com'),
  ('MEM002', '456 Elm Avenue', 'B002', 'Jane Smith', 9876543210, 'janesmith@example.com'),
  ('MEM003', '789 Oak Boulevard', 'B003', 'David Brown', 5555555555, 'davidbrown@example.com'),
  ('MEM004', '321 Pine Road', 'B004', 'Sarah Johnson', 1111111111, 'sarahjohnson@example.com'),
  ('MEM005', '567 Maple Lane', 'B005', 'Michael Wilson', 2222222222, 'michaelwilson@example.com'),
  ('MEM006', '890 Cedar Court', 'B006', 'Emily Davis', 3333333333, 'emilydavis@example.com'),
  ('MEM007', '432 Birch Street', 'B007', 'Daniel Lee', 4444444444, 'daniellee@example.com'),
  ('MEM008', '876 Oak Avenue', 'B008', 'Olivia Martin', 5555555555, 'oliviamartin@example.com'),
  ('MEM009', '901 Elm Road', 'B009', 'William Thompson', 6666666666, 'williamthompson@example.com'),
  ('MEM010', '234 Pine Court', 'B010', 'Sophia Garcia', 7777777777, 'sophiagarcia@example.com');
select * from pibd_library.member;


create table have(
Copy_Number int not null,
primary key(Copy_Number),
Book_ID char(10) not null,
Library_ID char(10) not null,
foreign key(Book_Id) references book(Book_ID),
foreign key(Library_ID) references library(Library_ID),
Number_Of_Copies int not null);
INSERT INTO pibd_library.have (Copy_Number, Book_ID, Library_ID, Number_OF_Copies)
VALUES
    (1, 'B001', 'L0001', 5),
    (2, 'B002', 'L0002', 5),
    (3, 'B003', 'L0003', 3),
    (4, 'B004', 'L0004', 3),
    (5, 'B005', 'L0005', 2),
    (6, 'B006', 'L0006', 1),
    (7, 'B007', 'L0007', 4),
    (8, 'B008', 'L0008', 2),
    (9, 'B009', 'L0009', 1),
    (10, 'B010', 'L0010', 3);
select * from pibd_library.have;

create table library(
Library_ID char(10) not null,
Phone_Number varchar(15) not null,
primary key(Library_ID,Phone_Number),
Address varchar(30) not null,
Website varchar(30) not null);
INSERT INTO library (Library_ID, Phone_Number, Address, Website)
VALUES
  ('L0001', 1234567890, '123 Main Street', 'www.library1.com'),
  ('L0002', 9876543210, '456 Elm Avenue', 'www.library2.com'),
  ('L0003', 5555555555, '789 Oak Boulevard', 'www.library3.com'),
  ('L0004', 1111111111, '321 Pine Lane', 'www.library4.com'),
  ('L0005', 9999999999, '543 Cedar Road', 'www.library5.com'),
  ('L0006', 7777777777, '876 Maple Street', 'www.library6.com'),
  ('L0007', 2222222222, '654 Elm Avenue', 'www.library7.com'),
  ('L0008', 4444444444, '987 Oak Boulevard', 'www.library8.com'),
  ('L0009', 8888888888, '456 Pine Lane', 'www.library9.com'),
  ('L0010', 6666666666, '321 Cedar Road', 'www.library10.com');
select * from pibd_library.library;

create table purchasing(
Purchasing_ID char(10) not null,
Date_Purchasing date not null,
primary key(Purchasing_ID,Date_Purchasing),
Library_ID char(10) not null,
Store_ID char(10),
foreign key(Library_ID)references library(Library_ID),
foreign key (Store_ID) references store(Store_ID),
Total_Price float(10,2) not null,
 Payment_Method varchar(30) not null);
  insert into pibd_library.purchasing(Purchasing_ID,Date_Purchasing,Library_ID,Store_ID,Total_Price,Payment_Method)
 values ('01A21', '2022-11-07', 'L0001', '01BukuKita', 3400000, 'Transfer Bank'),
		('01J22', '2022-11-19', 'L0002', '02Gramedia', 2300000, 'Transfer Bank'),
        ('08K87', '2022-05-14', 'L0003', '11Kinokuya', 6600000, 'Kredit'),
        ('00H45', '2022-05-30', 'L0004', '21Periplus', 1200000, 'Tunai'),
        ('03P09', '2022-03-29', 'L0005', '34Togamas', 3200000, 'Transfer Bank'),
        ('05W78', '2022-05-01','L0006', '2GgAgung', 4300000, 'Transfer Bank'),
        ('09Y89', '2022-01-01', 'L0007', '54BukaBuku', 990000, 'Tunai'),
        ('01T78', '2022-10-04', 'L0008', '13Aksara', 590000, 'Transfer Bank'),
        ('05E77', '2022-10-04', 'L0009', '51MzStore', 1590000, 'Transfer Bank'),
        ('03E33', '2022-04-05', 'L0010', '44Nara', 1400000, 'Transfer Bank');
 select * from pibd_library.purchasing;
 
 create table store(
 Store_ID char(10) not null,
 Book_Price float(10,2) not null,
 primary key(Store_ID,Book_Price),
 Supplier_ID char(10) not null,
 foreign key (Supplier_ID) references supplier(Supplier_ID),
 Address varchar(30) not null,
 Phone_Number varchar(15) not null );
 insert into store
values ('01BukuKita', 75000, '00098', 'Jl. Daan Mogot No. 1', 081234567899),
		('02Gramedia', 130000, '02109', 'Jl. Pattimura No. 16', 082112419344),
        ('11Kinokuya', 1200300, '02119', 'Jl. Jalan Merdeka', 087463956294),
        ('21Periplus', 5430000, '00110', 'Jl. Thamrin No. 11', 086582955398),
        ('34Togamas', 2200000, '01245', 'Jl. Pahlawan No. 1', 085482967391),
        ('2GgAgung', 335000, '00330', 'Jl. Juanda No. 10', 086583578294),
        ('54BukaBuku', 210700, '02201', 'Jl. Diponegoro No. 6', 089756482547),
        ('13Aksara', 112200, '00808', 'Jl. Ahmad Yani No. 2', 086572431746),
        ('51MzStore', 102000, '00830', 'Jl. Hayam Wuruk', 081647683456),
        ('44Nara', 987000, '00120', 'Jl. Sudirman No. 10', 082134543768);

 select * from pibd_library.store;
 
 create table Supplied_By(
 Store_ID char(10) not null,
 Supplier_ID char(10) not null,
 primary key(Store_ID,Supplier_ID),
 foreign key(Store_ID) references store(Store_ID),
 foreign key(Supplier_ID) references supplier(Supplier_ID),
 Date_Supply date not null);
 insert into Supplied_By
 values ('01BukuKita', '00098', '2022-05-07'),
		('02Gramedia', '02109', '2022-04-27'),
        ('11Kinokuya',  '02119', '2022-12-17'),
        ('21Periplus',  '00110',  '2022-01-21'),
        ('34Togamas',  '01245',  '2022-05-14'),
        ('2GgAgung',  '00330', '2022-05-23'),
        ('54BukaBuku', '02201', '2022-02-24'),
        ('13Aksara',  '00808', '2022-09-11'),
        ('51MzStore', '00830', '2022-01-23'),
        ('44Nara', '00120', '2022-01-01');

 select * from pibd_library.Supplied_By;
 
 
 create table supplier(
 Supplier_ID char(10) not null,
 Phone_Number varchar(15) not null,
 primary key(Supplier_ID,Phone_Number),
 Supplier_name varchar(30) not null,
 Address varchar(30) not null);
 insert into supplier
 values ('00098', 087463547573, 'BookDistributor', 'Jl. Melati No. 10'), 
		('02109', 081265733868, 'GlobalBook', 'Jl. Kenari No. 7'),
        ('02119', 085566388452, 'MegaBooks', 'Jl. Flamboyan No. 11'),
        ('00110', 089448211788, 'ReliableBook', 'Jl. Teratai'),
        ('01245', 081122899657, 'QualityBook', 'Jl. Bougenville No. 1'),
        ('00330', 0876569473759, 'PremierBook', 'Jl. Dahlia A'),
        ('02201', 089646395743, 'ExcelBook', 'Jl. Cempaka No. 3'),
        ('00808', 084538465823, 'BookDepot', 'Jl. Kamboja No. 14'),
        ('00830', 023758844656, 'AlphaBook', 'Jl. Anggrek No. 9'),
        ('00120', 083442655738, 'BestSellerBook', 'Jl. Mawar No. 2');

 select * from pibd_library.supplier;


