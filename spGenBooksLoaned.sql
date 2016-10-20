-- Query 5: Selecting total books loaned out by a given branch

USE BookKeeperPro
GO

CREATE PROCEDURE dbo.spBooksLoaned @BranchName nvarchar(80) = NULL
AS
SELECT Lib.BranchName, COUNT(Lo.BookID) 

FROM Book_Loans as Lo INNER JOIN Library_Branch as Lib
	ON Lo.BranchID = Lib.BranchID 
	INNER JOIN Book as bo
	ON Lo.BookID = bo.BookID
WHERE Lib.BranchName LIKE '%' + ISNULL(@BranchName,BranchName) + '%'
GROUP BY Lib.BranchName
GO

EXEC dbo.spBooksLoaned ''
