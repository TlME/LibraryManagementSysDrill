Alter TABLE Book
	--BookID int PRIMARY KEY(BookID)
	--,Title nvarchar(120) NULL
	ADD PublisherName nvarchar(60) FOREIGN KEY REFERENCES Publisher(Name)

go
CREATE TABLE Book_Authors(
	BookID int FOREIGN KEY REFERENCES Book(BookID)
	,AuthorName nvarchar(80) NULL
)
go
CREATE TABLE Publisher(
	Name nvarchar(60) PRIMARY KEY(Name)
	,[Address] nvarchar(60) NULL
	,Phone nvarchar(11) NULL
)
CREATE TABLE Library_Branch(
	BranchID int PRIMARY KEY(BranchID)
	,BranchName nvarchar(80) NULL
	,[Address] nvarchar(60) NULL
)
GO
CREATE TABLE Book_Copies(
	BookID int FOREIGN KEY REFERENCES Book(BookID)
	,BranchID int FOREIGN KEY REFERENCES Library_Branch(BranchID)
	,No_of_Copies int NULL
)
GO
CREATE TABLE Borrower(
	CardNo int PRIMARY KEY(CardNo)
	,Name nvarchar(60) NULL
	,[Address] nvarchar(60) NULL
	,Phone nvarchar(11) NULL
)
GO
CREATE TABLE Book_Loans(
	BookID int FOREIGN KEY REFERENCES Book(BookID)
	,BranchID int FOREIGN KEY REFERENCES Library_Branch(BranchID)
	,CardNo int FOREIGN KEY REFERENCES Borrower(CardNo)
	,DateOut DATE NULL
	,DueDate DATE NULL
)