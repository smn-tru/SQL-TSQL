USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_Insert]    Script Date: 8/31/2022 11:00:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [dbo].[Presidents_Insert]
			@FirstName nvarchar(50)
           ,@LastName nvarchar(50)
           ,@InaugurationDate datetime2(7)
           ,@FirstYearInOffice int
           ,@LastYearInOffice int
           ,@PartyAffiliation nvarchar(50)
		   ,@Id int OUTPUT

/*
	DECLARE @Id int = 0

	DECLARE @FirstName nvarchar(50) = 'George'
           ,@LastName nvarchar(50) = 'Washington'
           ,@InaugurationDate datetime2(7) = '1789-04-30'
           ,@FirstYearInOffice int = 1789
           ,@LastYearInOffice int = 1797
           ,@PartyAffiliation nvarchar(50) = 'No Party'
		   

	EXECUTE dbo.Presidents_Insert

			@FirstName
           ,@LastName 
           ,@InaugurationDate
           ,@FirstYearInOffice 
           ,@LastYearInOffice
           ,@PartyAffiliation
		   ,@Id OUTPUT

	SELECT *
	FROM dbo.Presidents
	WHERE Id  = @Id


*/

AS

BEGIN

	INSERT INTO [dbo].[Presidents]
           ([FirstName]
           ,[LastName]
           ,[InaugurationDate]
           ,[FirstYearInOffice]
           ,[LastYearInOffice]
           ,[PartyAffiliation])
     VALUES
           (@FirstName
           ,@LastName
           ,@InaugurationDate
           ,@FirstYearInOffice
           ,@LastYearInOffice
           ,@PartyAffiliation)

		SET @Id = SCOPE_IDENTITY()

END