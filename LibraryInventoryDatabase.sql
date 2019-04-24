use master
go
drop database LibraryInventoryDatabase;
go
create database LibraryInventoryDatabase;
go
use LibraryInventoryDatabase;
go


-- Libraries
create table LibraryBranch (
    BranchID int not null primary key identity (1,1),
    BranchName varchar(50) not null,
    Address varchar(50) not null
    );
insert into LibraryBranch (BranchName, Address)
    values
    ('Sharpstown', '514 NE 303rd St, Baldur''s Gate, NV 10556'),
    ('Central', '11542 SW Blueberry Rd, Tiny Kansas, NV 10558'),
    ('City College of Raccoon', '1313 N Good St, Raccoon City, CL 47549'),
    ('GYM Library', 'Rt 2, Pewter City, KT 5');


-- Publishers
create table Publisher (
    PublisherName varchar(50) not null primary key,
    Address varchar(50) not null,
    Phone char(12) not null
    );
insert into Publisher (PublisherName, Address, Phone)
    values
    ('Bookboy', '1818 Mill St., Greenwood, SC 29646', '864-229-3085'),
    ('Booksavage', '5641 Savage St., Savageland, Q 83814', '208-297-2341'),
    ('Viking', '4896 Scary St, New York City, NY 89126', '712-739-6541'),
    ('Pan Books', '65 Holburn Lane, London, UK PL32 7NN', '712-739-6541');


-- Books
create table Books (
    BookID int not null primary key identity (1,1),
    Title varchar(50) not null unique,
    PublisherName varchar(50) not null foreign key references Publisher(PublisherName) on delete cascade on update cascade
    );
insert into Books (Title, PublisherName)
    values
    ('Kill la Kill la Kill la Kill', 'Bookboy'),
    ('The Browns Live in your Pants', 'Booksavage'),
    ('The Lost Tribe', 'Bookboy'),
    ('Open Your Mouth: A Guide To Opening Your Mouth', 'Bookboy'),
    ('Trapped Inside a Walnut', 'Booksavage'),
    ('It', 'Viking'),
    ('Pet Sematary', 'Viking'),
    ('The Shining', 'Viking'),
    ('Cujo', 'Viking'),
    ('Nukkle Boy: 3 Nukkles Per Hand', 'Booksavage'),
    ('Nukkle Boy: 4 Limbs to Beat-Smack You', 'Booksavage'),
    ('The Hitchhiker''s Guide to the Galaxy', 'Pan Books'),
    ('The Restaurant at the End of the Universe', 'Pan Books'),
    ('Life, the Universe and Everything', 'Pan Books'),
    ('Smell Ya Later', 'Bookboy'),
    ('You are a Badboi: How To Self-Inflate ''Til You Pop', 'Booksavage'),
    ('Mastercard(R) Guide to Benefits', 'Bookboy'),
    ('A Fridge Full of Wonders: Narnia But More Ice', 'Bookboy'),
    ('Daddy''s Hungry For Hummus: Cooking With Hummus', 'Booksavage'),
    ('Tart Tart: Putt Putt', 'Bookboy');


-- Authors
create table BookAuthors (
    BookID int not null foreign key references Books(BookID) on delete cascade on update cascade,
    AuthorName varchar(30) not null
    );
insert into BookAuthors (BookID, AuthorName)
    values
    (1, 'Triggeriggerigger'),
    (2, 'Dan Browns'),
    (3, 'H. Perlman'),
    (4, 'Samuel'),
    (5, 'H. Perlman'),
    (6, 'Stephen King'),
    (7, 'Stephen King'),
    (8, 'Stephen King'),
    (9, 'Stephen King'),
    (10, 'Julien Klunk'),
    (11, 'Julien Klunk'),
    (12, 'Douglas Adams'),
    (13, 'Douglas Adams'),
    (14, 'Douglas Adams'),
    (15, 'Gary Oak'),
    (16, 'Jen Sincero'),
    (17, 'Mastercard'),
    (18, 'Mastercard'),
    (19, 'Daddy H. aka Momma H.'),
    (20, 'Pouet Pauet');


-- Borrowers
create table Borrower (
    CardNo int not null primary key identity (100000001,1),
    Name varchar(30) not null,
    Address varchar(50) not null,
    Phone char(12)
    );
insert into Borrower (Name, Address, Phone)
    values
    ('Tiny Youngman', '514 1st St., City, NV 14141', '555-653-8402'),
    ('Grok Plubmer', '127 32st St., Salsbury, NV 14141', '555-355-4735'),
    ('Terry Kolswitz', '982 Ivory Rd., Reno, NV 239932', '555-451-5322'),
    ('Tarry Kolswitz', '982 Ivory Rd., Reno, NV 239932', '555-693-1733'),
    ('Gary Oak', 'Rt 1, Pallet Town, KT 1', '555-554-4554'),
    ('Prof. Oak', 'Rt 1, Pallet Town, KT 1', '555-355-5453'),
    ('Zach Zaechle', '2722 A Rd., Down, SW 14587', '555-787-7851'),
    ('Siegfried Fitz', '2 SE 1st, Port Town, NV 00001', '555-001-0010'),
    ('Bartholomew Bubblemaker', '3 NW 3rd, Port Town, NV 00022', '555-011-1001'),
    ('Albert B.B. Boy', '7 NE 2nd, Port Town, NV 00013', '555-100-0101');


-- Book Inventory
create table BookCopies (
    BookID int not null foreign key references Books(BookID) on delete cascade on update cascade,
    BranchID int not null foreign key references LibraryBranch(BranchID) on delete cascade on update cascade,
    NumberOfCopies int
    );
insert into BookCopies (BookID, BranchID, NumberOfCopies)
    values
    -- Sharpstown
    (1, 1, 50),  (2, 1, 25),  (3, 1, 4),  (4, 1, 16),  (5, 1, 94),
    (8, 1, 23),  (9, 1, 10),  (12, 1, 8), (13, 1, 8),  (14, 1, 81),
    -- Central
    (2, 2, 11),  (3, 2, 22),  (4, 2, 45), (5, 2, 2),   (6, 2, 5),
    (7, 2, 7),   (8, 2, 26),  (10, 2, 31),(11, 2, 4),  (14, 2, 5),
    -- Raccoon
    (2, 3, 19),  (4, 3, 11),  (6, 3, 25), (7, 3, 25),  (8, 3, 25),
    (9, 3, 25),  (16, 3, 2),  (17, 3, 7), (18, 3, 12), (19, 3, 16),
    -- GYM
    (15, 4, 250),(20, 4, 241);


-- Book Loans
create table BookLoans (
    BookID int not null foreign key references Books(BookID) on delete cascade on update cascade,
    BranchID int not null foreign key references LibraryBranch(BranchID) on delete cascade on update cascade,
    CardNo int not null foreign key references Borrower(CardNo) on delete cascade on update cascade,
    DateOut date not null,
    DateDue date not null
    );
insert into BookLoans (BookID, BranchID, CardNo, DateOut, DateDue)
    values
    -- I just realized this random data might 'loan-out' more copies of a book than exist.
    (15, 4, 100000005, '2019-08-11', '2019-09-01'),
    (13, 4, 100000001, '2019-08-07', '2019-08-28'),
    (8,  4, 100000003, '2019-08-13', '2019-09-03'),
    (1,  4, 100000004, '2019-08-11', '2019-09-01'),
    (1,  4, 100000006, '2019-08-06', '2019-08-27'),
    (11, 3, 100000005, '2019-08-07', '2019-08-28'),
    (13, 2, 100000006, '2019-08-13', '2019-09-03'),
    (12, 1, 100000005, '2019-08-10', '2019-08-31'),
    (15, 3, 100000007, '2019-08-08', '2019-08-29'),
    (3,  1, 100000005, '2019-08-07', '2019-08-28'),
    (19, 4, 100000007, '2019-08-13', '2019-09-03'),
    (20, 3, 100000002, '2019-08-13', '2019-09-03'),
    (17, 3, 100000007, '2019-08-07', '2019-08-28'),
    (19, 3, 100000008, '2019-08-12', '2019-09-02'),
    (19, 3, 100000003, '2019-08-06', '2019-08-27'),
    (14, 4, 100000004, '2019-08-07', '2019-08-28'),
    (6,  4, 100000001, '2019-08-11', '2019-09-01'),
    (3,  4, 100000005, '2019-08-09', '2019-08-30'),
    (13, 2, 100000004, '2019-08-12', '2019-09-02'),
    (15, 1, 100000007, '2019-08-11', '2019-09-01'),
    (13, 2, 100000005, '2019-08-11', '2019-09-01'),
    (14, 2, 100000004, '2019-08-08', '2019-08-29'),
    (2,  2, 100000007, '2019-08-06', '2019-08-27'),
    (13, 1, 100000007, '2019-08-11', '2019-09-01'),
    (6,  2, 100000002, '2019-08-08', '2019-08-29'),
    (9,  2, 100000002, '2019-08-08', '2019-08-29'),
    (18, 3, 100000003, '2019-08-11', '2019-09-01'),
    (18, 1, 100000008, '2019-08-09', '2019-08-30'),
    (5,  4, 100000008, '2019-08-06', '2019-08-27'),
    (15, 3, 100000008, '2019-08-07', '2019-08-28'),
    (7,  1, 100000003, '2019-08-07', '2019-08-28'),
    (11, 3, 100000008, '2019-08-08', '2019-08-29'),
    (19, 4, 100000001, '2019-08-07', '2019-08-28'),
    (13, 2, 100000006, '2019-08-06', '2019-08-27'),
    (10, 2, 100000001, '2019-08-12', '2019-09-02'),
    (6,  3, 100000003, '2019-08-12', '2019-09-02'),
    (9,  3, 100000002, '2019-08-13', '2019-09-03'),
    (9,  1, 100000008, '2019-08-12', '2019-09-02'),
    (4,  4, 100000005, '2019-08-06', '2019-08-27'),
    (6,  1, 100000003, '2019-08-12', '2019-09-02'),
    (15, 1, 100000005, '2019-08-09', '2019-08-30'),
    (11, 4, 100000005, '2019-08-08', '2019-08-29'),
    (15, 2, 100000005, '2019-08-10', '2019-08-31'),
    (5,  4, 100000008, '2019-08-06', '2019-08-27'),
    (18, 4, 100000001, '2019-08-10', '2019-08-31'),
    (13, 2, 100000007, '2019-08-12', '2019-09-02'),
    (1,  3, 100000008, '2019-08-06', '2019-08-27'),
    (15, 1, 100000008, '2019-08-06', '2019-08-27'),
    (13, 3, 100000002, '2019-08-11', '2019-09-01'),
    (14, 2, 100000003, '2019-08-06', '2019-08-27');


-- Unimportants:
/*
select * from LibraryBranch;
select * from Publisher;
select * from Books;
select * from BookAuthors;
select * from Borrower;
select * from BookCopies;
select * from BookLoans;
*/