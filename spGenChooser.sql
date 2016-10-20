USE BookKeeperPro
GO

CREATE PROCEDURE dbo.spChooser @ProcedureChoice int = NULL
AS

IF(@ProcedureChoice = 1)
BEGIN
	EXEC dbo.spGetCopies 'The Lost Tribe', 'Sharpstown'
END
IF(@ProcedureChoice = 2)
BEGIN
	EXEC dbo.spGetCopies 'The Lost Tribe', ''
END
IF(@ProcedureChoice = 3)
BEGIN
	EXEC dbo.spGetDeadbeatNames
END
IF(@ProcedureChoice = 4)
BEGIN
	EXEC dbo.spDueToday '2016-10-19', 'Sharps'
END
IF(@ProcedureChoice = 5)
BEGIN
	EXEC dbo.spBooksLoaned ''
END
IF(@ProcedureChoice = 6)
BEGIN
	EXEC dbo.spGetReaderInfo 5
END
IF(@ProcedureChoice = 7)
BEGIN
	EXEC dbo.spGetCopiesByAuthor 'Stephen King', 'Central'
END

GO

EXEC dbo.spChooser 4
