-- Query 4: Selecting books based on DueDate and Branch

USE BookKeeperPro
GO

CREATE PROCEDURE dbo.spDueToday @DueDate date = NULL, @BranchName nvarchar(80) = NULL
AS
SELECT Lib.BranchName,bo.Title,br.Name,br.[Address], Lo.DueDate

FROM Book_Loans as Lo INNER JOIN Library_Branch as Lib
	ON Lo.BranchID = Lib.BranchID 
	INNER JOIN Book as bo
	ON Lo.BookID = bo.BookID
	INNER JOIN Borrower as br
	ON Lo.CardNo = br.CardNo

WHERE Lo.DueDate = ISNULL(@DueDate,DueDate) 
AND Lib.BranchName LIKE '%' + ISNULL(@BranchName,BranchName) + '%'
GO
EXEC dbo.spDueToday '2016-10-19','Sharps'
