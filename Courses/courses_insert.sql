USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Insert]    Script Date: 8/31/2022 10:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Courses_Insert]
				@Name nvarchar(200)
			   ,@Description nvarchar(200)
			   ,@SeasonTermId int
			   ,@TeacherId int
			   ,@Id int OUTPUT

/*

	DECLARE @Id int = 0;

	DECLARE		@Name nvarchar(200) = 'Marketing II'
			   ,@Description nvarchar(200) = 'Business Studies'
			   ,@SeasonTermId int = 1
			   ,@TeacherId int = 7
			   

	EXECUTE dbo.Courses_Insert
				@Name 
			   ,@Description 
			   ,@SeasonTermId 
			   ,@TeacherId 
			   ,@Id
			  
	SELECT * 
	FROM dbo.Courses
	WHERE Id = @Id




*/




AS

BEGIN

	INSERT INTO [dbo].[Courses]
           ([Name]
           ,[Description]
           ,[SeasonTermId]
           ,[TeacherId])
     VALUES
           (	@Name 
			   ,@Description 
			   ,@SeasonTermId 
			   ,@TeacherId )

	SET @Id = SCOPE_IDENTITY()

END