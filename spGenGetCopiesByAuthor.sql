-- Query 7: Selecting Title and number of copies of a book with a defined @AuthorName and @BranchName
USE BookKeeperPro
GO

CREATE PROCEDURE dbo.spGetCopiesByAuthor @AuthorName nvarchar(80) = NULL, @BranchName nvarchar(80) = NULL
AS
SELECT L.BranchName,bk.Title,bc.No_of_Copies
FROM Book as bk INNER JOIN Book_Copies as bc 
ON bk.BookID = bc.BookID
INNER JOIN Book_Authors as A
ON bk.BookID = A.BookID
INNER JOIN Library_Branch as L
ON bc.BranchID = L.BranchID
WHERE A.AuthorName LIKE '%' + ISNULL(@AuthorName,AuthorName) + '%'
AND L.BranchName LIKE '%' + ISNULL(@BranchName,BranchName) + '%'
GO

EXEC dbo.spGetCopiesByAuthor 'Steph','Cent'
