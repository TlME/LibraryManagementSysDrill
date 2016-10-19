USE master
GO

DROP DATABASE BookKeeperPro
GO

CREATE DATABASE BookKeeperPro
GO
USE BookKeeperPRo
GO
CREATE TABLE Publisher(
	Name nvarchar(60) PRIMARY KEY(Name)
	,[Address] nvarchar(63) NULL
	,[City] nvarchar(35) NULL
	,[State] nvarchar(25) NULL
	,ZIP nvarchar(12) NULL
	,Phone nvarchar(16) NULL
)
GO
CREATE TABLE Book(
	BookID int IDENTITY(100,1) PRIMARY KEY(BookID)
	,Title nvarchar(120) NULL
	,PublisherName nvarchar(60) 
	)
go
CREATE TABLE Book_Authors(
	BookID int IDENTITY (100,1) 
	,AuthorName nvarchar(80) NULL
)
go

CREATE TABLE Library_Branch(
	BranchID int IDENTITY(10,5) PRIMARY KEY(BranchID)
	,BranchName nvarchar(80) NULL
	,[Address] nvarchar(60) NULL
)
GO
CREATE TABLE Book_Copies(
	BookID int 
	,BranchID int 
	,No_of_Copies int NULL
)
GO
CREATE TABLE Borrower(
	CardNo int IDENTITY(3500,1) PRIMARY KEY(CardNo)
	,Name nvarchar(60) NULL
	,[Address] nvarchar(60) NULL
	,Phone nvarchar(19) NULL
)
GO
CREATE TABLE Book_Loans(
	BookID int 
	,BranchID int 
	,CardNo int
	,DateOut DATE NULL
	,DueDate DATE NULL
)
GO
INSERT INTO Publisher (Name,[Address],[City],[State],[Zip],Phone)
	VALUES ('Penguin Books Group','375 Hudson Street','New York','New York','10014','201-203-9878')
	,('Jeremy P. Tarcher Inc.','5858 Wilshire Blvd. Suite 200','Los Angeles','California','90036',NULL)
	,('Taylor Trade Publishing','4501 Forbes Blvd. Suite 200','Lanham','Maryland','20706',NULL)
	,('Vintage Books',NULL,'New York','New York','10011',NULL)
	,('Clarkson N. Potter Inc.','225 Park Avenue South','New York','New York','10003','201-304-9107')
	,('Full Court Press','601 Palisade Avenue','Englewood Cliffs','New Jersey','07632','201-294-9111')
	,('TIME Inc.','1120 Avenue of the Americas','New York','New York','10036',NULL)
	,('Ginkgo Press',NULL,NULL,NULL,NULL,NULL)
	,('Bloomsbury Publishing','50 Bedford Square','London','UK','WC1B3DP',NULL)
	,('Viking Press',NULL,'New York','New York',NULL,NULL)
	,('Holt Paperbacks','175 Fifth Avenue - 10th Floor','New York','New York','10010','646-307-0748')
	,('Hackett Publishing','3333 Massachusetts Avenue','Indianapolis','Indiana','46218','317-635-9250')
	,('Scholastic','557 Broadway','New York','New York','10012',NULL)

GO
INSERT INTO Book (Title,PublisherName)
	VALUES ('A Tale for the Time Being','Penguin Books Group'),('Managing Your Anxiety','Jeremy P. Tarcher Inc.')
	,('Attention Deficit Disorder in Adults','Taylor Trade Publishing'),('Beautiful Losers','Vintage Books')
	,('Evening Games: Tales of Parents and Children','Clarkson N. Potter Inc.'),('Indian Winter','Full Court Press')
	,('A Kitchen in France: A Year of Cooking in my Farmhouse','Clarkson N. Potter Inc.'),('Food & Wine - Best of the Best','TIME Inc.')
	,('Emek... the Thinking Mans Poster Artist','Gingko Press'),('The Song of Achilles','Bloomsbury Publishing'),('Brave New World','Penguin Books Group')
	,('Misery','Viking Press'),('IT','Viking Press'),('The Lost Tribe','Holt Paperbacks')
	,('Nichomachean Ethics','Hackett Publishing'),('Of Mice and Men','Penguin Books Group')
	,('Siddhartha','Hackett Publishing'),('Harry Potter and the Sorcerers Stone','Scholastic'),('1984','Bloomsbury Publishing')
	,('The Hobbit','Scholastic'),('Republic','Hackett Publishing')
	,('Harry Potter and the Chamber of Secrets','Scholastic'),('Harry Potter and the Prisoner of Azkaban','Scholastic'
	)
GO

INSERT INTO Book_Authors (AuthorName)
	VALUES ('Ruth Ozeki'),('Christopher J. McCullough'),('Dr. Lynn Weiss'),('Leonard Cohen'),('Alberto Manguel'),('Jane Laura Goldsmith')
		,('Mimi Thorrison'),('Dana Cowin'),('Emek Golan'),('Madeline Miller'),('Aldous Huxley'),('Stephen King'),('Stephen King'),('Edward Marriott')
		,('Aristotle'),('John Steinbeck'),('Herman Hesse'),('J.K. Rowling'),('George Orwell'),('J.R.R. Tolkien'),('Plato'),('J.K. Rowling'),('J.K. Rowling'
		)
GO

INSERT INTO Library_Branch (BranchName,[Address])
	VALUES ('Sharpstown','300 Library Ave.') --10
	,('Central','1190 Main Street') --15
	,('Duckburg','645 West Peterson Blvd.') --20
	,('Goldshire','1200 Meme Inn Way') --25
	,('Plattsville','280 Scholars Lane') --30
GO

INSERT INTO Borrower(Name,[Address],Phone)
	VALUES ('Peter Dinklage','403 Lannister Avenue','620-587-3525')--3500
	,('Lena Headey','27 Cersei Street','480-374-7623')
	,('Emilia Clarke','4587 Targaryen Road, Unit 6','636-792-1289') --3502
	,('Kit Harington','6969 Know Nothing Pkwy.','247-734-5681')
	,('Aidan Gillen','350 Baelish Road','135-768-1944') --3504
	,('Maisie Williams','555 Fivehead Avenue','555-555-4323')
	,('Sean Bean','3323 Guy Road','893-260-3564') --3506
	,('John Bradley','800 Tarly Street','348-900-7272')
	,('Harry Lloyd','610 Viseral Road','560-890-2535') --3508
GO
INSERT INTO Book_Copies(BookID,BranchID,No_of_Copies)
	VALUES (101,10,2),(103,10,3),(102,10,2),(104,10,6),(100,10,2),(105,10,2),(106,10,2)
	,(107,10,2),(108,10,7),(109,10,2),(110,10,3),(111,10,2),(112,10,5),(113,10,2),(114,10,2)
	,(100,15,5),(102,15,2),(104,15,3),(106,15,2),(108,15,2),(110,15,2),(112,15,3),(114,15,2),(116,15,2)
	,(118,15,6),(120,15,2),(122,15,2),(101,15,3),(103,15,2),(105,15,2),(107,15,2),(109,15,2),(111,15,3)
	,(100,20,2),(101,20,3),(102,20,4),(103,20,2),(104,20,3),(105,20,4),(106,20,2),(107,20,3)
	,(108,20,4),(109,20,2),(110,20,3),(111,20,4),(112,20,2),(113,20,3),(114,20,4),(115,20,2),(116,20,3)
	,(117,20,4),(118,20,2),(119,20,3),(120,20,4),(121,20,2),(100,25,2),(101,25,3),(102,25,4),(103,25,2)
	,(104,25,3),(105,25,4),(106,25,2),(107,25,3),(108,25,4),(109,25,2),(110,25,3),(111,25,4),(112,25,2)
	,(113,25,3),(114,25,4),(115,25,2),(116,25,3),(117,25,4),(118,25,2),(119,25,3),(120,25,4),(121,25,2)
	,(122,25,3),(100,30,2),(101,30,3),(102,30,4),(103,30,2),(104,30,3),(105,30,4),(106,30,2),(107,30,3)
	,(108,30,4),(109,30,2),(110,30,3),(111,30,4),(112,30,2),(113,30,3),(114,30,4),(115,30,2),(116,30,3)
	,(117,30,4),(118,30,2)
GO
INSERT INTO Book_Loans(BookID,BranchID,CardNo,DateOut,DueDate)
	VALUES (116,20,3500,'2016-10-14','2016-10-28'),(108,15,3500,'2016-10-2','2016-10-7'),(123,15,3500,'2016-10-7','2016-10-14'),(107,25,3500,'2016-10-8','2016-10-13'),(114,30,3500,'2016-10-6','2016-10-15'),(118,20,3500,'2016-10-7','2016-10-13'),(105,30,3500,'2016-10-4','2016-10-18'),(114,20,3500,'2016-10-9','2016-10-19'),(109,15,3500,'2016-10-5','2016-10-19'),(117,30,3500,'2016-10-3','2016-10-11'),(115,30,3500,'2016-10-8','2016-10-18'),
(104,10,3501,'2016-10-4','2016-10-15'),(107,25,3501,'2016-10-1','2016-10-10'),(105,15,3501,'2016-10-10','2016-10-16'),(115,30,3501,'2016-10-8','2016-10-22'),
(105,30,3502,'2016-10-10','2016-10-15'),(120,15,3502,'2016-10-1','2016-10-8'),(122,10,3502,'2016-10-7','2016-10-12'),(110,25,3502,'2016-10-11','2016-10-19'),(112,10,3502,'2016-10-10','2016-10-19'),(122,30,3502,'2016-10-12','2016-10-22'),(114,30,3502,'2016-10-10','2016-10-15'),
(120,10,3503,'2016-10-1','2016-10-13'),(104,10,3503,'2016-10-12','2016-10-22'),(108,10,3503,'2016-10-11','2016-10-21'),
(116,10,3504,'2016-10-6','2016-10-15'),(102,30,3504,'2016-10-14','2016-10-21'),
(107,20,3505,'2016-10-14','2016-10-24'),(117,25,3505,'2016-10-5','2016-10-11'),(120,15,3505,'2016-10-4','2016-10-10'),(109,15,3505,'2016-10-14','2016-10-19'),
(102,30,3506,'2016-10-14','2016-10-24'),(110,10,3506,'2016-10-13','2016-10-21'),(107,10,3506,'2016-10-13','2016-10-25'),(118,25,3506,'2016-10-6','2016-10-13'),(119,10,3506,'2016-10-3','2016-10-13'),(101,30,3506,'2016-10-5','2016-10-14'),(120,10,3506,'2016-10-10','2016-10-19'),(118,30,3506,'2016-10-6','2016-10-11'),(103,25,3506,'2016-10-13','2016-10-26'),(119,10,3506,'2016-10-5','2016-10-18'),
(105,25,3507,'2016-10-6','2016-10-11'),(112,30,3507,'2016-10-9','2016-10-16'),(110,20,3507,'2016-10-11','2016-10-25'),(114,20,3507,'2016-10-6','2016-10-19'),(123,25,3507,'2016-10-6','2016-10-16'),(103,30,3507,'2016-10-14','2016-10-20'),(109,25,3507,'2016-10-9','2016-10-18')

GO