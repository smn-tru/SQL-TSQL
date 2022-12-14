USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_Pagination]    Script Date: 8/31/2022 10:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_Search_Pagination]
			@PageIndex int
			,@PageSize int
			,@Query nvarchar(50)

/*

	Declare @PageIndex int = 0
	Declare @PageSize int = 5
	Declare @Query nvarchar(50) = 'Mr'

	SELECT *
	FROM dbo.Friends
	WHERE (Title LIKE '%' + @Query + '%') 




*/

as

BEGIN

	Declare @offset int = @PageIndex * @PageSize

	SELECT [Id]
      ,[Title]
      ,[Bio]
      ,[Summary]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
      ,[PrimaryImageUrl]
      ,[DateCreated]
      ,[DateModified]
      ,[UserId]
	   ,TotalCount = COUNT(1) OVER()
  FROM [dbo].[Friends]
  WHERE (Title LIKE '%' + @Query + '%')

  ORDER BY Id

  OFFSET @offset Rows
  Fetch Next @PageSize Rows ONLY


END