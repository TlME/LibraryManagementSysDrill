-- Query 6: Selecting contact info of borrowers with more than 5 books checked out. 
USE BookKeeperPro
GO

CREATE PROCEDURE dbo.spGetReaderInfo @Num int = NULL 
AS
SELECT br.Name,br.[Address], COUNT(L.BookID) AS NumberOfBooks
FROM Book_Loans as L INNER JOIN Borrower as br
ON L.CardNo = br.CardNo 
GROUP BY 
br.Name,
br.[Address]
HAVING COUNT(L.BookID) >= @Num; 
GO

EXEC dbo.spGetReaderInfo 5
