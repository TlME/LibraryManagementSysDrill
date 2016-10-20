-- Query 1-2: Selecting copies of "The Lost Tribe" at Sharpstown Library
USE BookKeeperPro
GO

ALTER PROCEDURE dbo.spGetCopies @Title nvarchar(120) = NULL, @BranchName nvarchar(80) = NULL
AS
SELECT L.BranchName,c.No_of_Copies
FROM Book_Copies as c INNER JOIN Library_Branch as L
ON c.BranchID = L.BranchID 
LEFT OUTER JOIN Book as b
ON c.BookID = b.BookID
WHERE b.Title LIKE '%' + ISNULL(@Title,Title) + '%' 
AND L.BranchName LIKE '%' + ISNULL(@BranchName,BranchName) + '%'
GO
EXEC spGetCopies 'Lost','Sharps'

