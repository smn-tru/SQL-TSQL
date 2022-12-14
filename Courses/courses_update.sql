USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Update]    Script Date: 8/31/2022 10:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Courses_Update]
			 @Id int
			,@Name nvarchar(200)
			,@Description nvarchar(200)
			,@SeasonTermId int
			,@TeacherId int



/*


	DECLARE @Id int = 7
			,@Name nvarchar(200) = 'Medical Terminology'
			,@Description nvarchar(200) = 'Medicine'
			,@SeasonTermId int = 4
			,@TeacherId int = 8
			,@Students 

	Select *
	From dbo.Courses
	Where Id = @Id

	EXECUTE dbo.Courses_Update
			@Id
			,@Name
			,@Description
			,@SeasonTermId
			,@TeacherId
			,@Students

	SELECT @Id

	SELECT *
	FROM dbo.Courses
	WHERE Id = @Id



*/




AS

BEGIN
	

	

	UPDATE [dbo].[Courses]
   SET 
       [Name] = @Name
      ,[Description] = @Description
      ,[SeasonTermId]  = @SeasonTermId					
      ,[TeacherId]  = @TeacherId



  WHERE Id = @Id

END