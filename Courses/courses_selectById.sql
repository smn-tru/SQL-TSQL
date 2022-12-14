USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_SelectById]    Script Date: 8/31/2022 10:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Courses_SelectById]
				@Id int
/*
	DECLARE @Id int = 5
	EXECUTE dbo.[Courses_SelectById] @Id

	


*/

AS

BEGIN

	SELECT c.[Id] 
      ,c.[Name] 
      ,[Description]
      ,s.[Term]  as SeasonTerm
								
      ,t.[Name]  as Teacher
	  ,[Students] = (SELECT su.Id as Id
						,su.Name as Name
					FROM dbo.StudentCourses as sc inner join dbo.Students as su
						on su.Id = sc.StudentId
					WHERE sc.CourseId = c.Id	
					FOR JSON AUTO)
  FROM dbo.Courses as c
		 inner join dbo.SeasonTerms as s
			on c.SeasonTermId = s.Id
		inner join dbo.Teachers as t
			on c.TeacherId = t.Id


  WHERE c.Id = @Id
		

END