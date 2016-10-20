-- Query 3: Selecting names of borrowers with no books checked out. (Should @Return Harry Lloyd)
USE BookKeeperPro
GO

ALTER PROCEDURE dbo.spGetDeadbeatNames
AS
SELECT br.Name,bo.Title
FROM Book as bo INNER JOIN Book_Loans as L 
ON bo.BookID = L.BookID
RIGHT OUTER JOIN Borrower as br
ON L.CardNo = br.CardNo 
WHERE L.CardNo IS NULL 
GO
EXEC dbo.spGetDeadbeatNames
