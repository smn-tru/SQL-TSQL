USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Pagination]    Script Date: 8/31/2022 10:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_Pagination]
			@PageIndex int
			,@PageSize int

/*
	Select *
	FROM dbo.Friends
	ORDER BY Id

	OFFSET 0 ROWS
	FETCH NEXT 5 ROWS ONLY;


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
  ORDER BY Id

  OFFSET @offSet Rows
  Fetch Next @PageSize Rows ONLY

END