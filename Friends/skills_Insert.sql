USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Skills_Insert]    Script Date: 8/31/2022 11:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [dbo].[Skills_Insert]
			@Name nvarchar(50)
		   ,@Id int OUTPUT

/*

	DECLARE @Id int = 0

	DECLARE @Name nvarchar(50) = 'C#'

	EXECUTE dbo.Skills_Insert
			 @Name
			,@Id 

	SELECT *
	FROM dbo.Skills
	WHERE Id = @Id

*/

AS

BEGIN

	INSERT INTO [dbo].[Skills]
           ([Name])
		VALUES
           (@Name)

		SET @Id = SCOPE_IDENTITY()

END