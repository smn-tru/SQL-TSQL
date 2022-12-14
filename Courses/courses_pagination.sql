USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Pagination]    Script Date: 8/31/2022 10:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Courses_Pagination]
				@PageIndex int
				,@PageSize int



/*
	DECLARE @pageIndex int = 0
	DECLARE @pageSize int = 5
	Declare @offset int = @PageIndex * @PageSize


	SELECT c.[Id] 
      ,c.[Name] 
      ,[Description]
      ,s.[Term]  as SeasonTerm
								
      ,t.[Name]  as Teacher
	  ,Students = (SELECT su.Id as Id
						,su.Name as Name
					FROM dbo.Students as su inner join StudentCourses as sc
						on sc.StudentId = su.Id
							Where sc.CourseId = Id
					FOR JSON AUTO)
	 ,TotalCount = COUNT(1) OVER()
  FROM dbo.Courses as c
		 inner join dbo.SeasonTerms as s
			on c.SeasonTermId = s.Id
		inner join dbo.Teachers as t
			on c.TeacherId = t.Id

	ORDER BY Id
	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY



*/

AS

BEGIN
		DECLARE @offset int = @PageIndex * @PageSize

	
	SELECT c.[Id] 
      ,c.[Name] 
      ,[Description]
      ,s.[Term]  as SeasonTerm
								
      ,t.[Name]  as Teacher
	  ,Students = (SELECT su.Id as Id
						,su.Name as Name
					FROM dbo.StudentCourses as sc inner join dbo.Students as su
						on su.Id = sc.StudentId
					WHERE sc.CourseId = c.Id	
					FOR JSON AUTO)
	 ,TotalCount = COUNT(1) OVER()
  FROM dbo.Courses as c
		 inner join dbo.SeasonTerms as s
			on c.SeasonTermId = s.Id
		inner join dbo.Teachers as t
			on c.TeacherId = t.Id

	ORDER BY Id

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY

END