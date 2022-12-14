USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV2]    Script Date: 8/31/2022 10:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_Search_PaginationV2]
				 @PageIndex int
				,@PageSize int
				,@Query nvarchar(50)

/*
	Declare @PageIndex int = 0
		   ,@PageSize int = 5
		   ,@Query nvarchar(50) = 'Ms'

	SELECT *
	FROM  dbo.Images as i inner join dbo.FriendsV2 as v
		on i.Id = v.PrimaryImageId
	WHERE (Title LIKE '%' + @Query + '%')



*/

as

BEGIN

	DECLARE @offset int = @PageIndex * @PageSize

	SELECT v.[Id]
		  ,i.[Url] as ImageUrl
		  ,i.[Id] as ImageId
		  ,i.[TypeId]
		  ,[Title]
		  ,[Bio]
		  ,[Summary]
		  ,[Headline]
		  ,[Slug]
		  ,[StatusId]
		  ,v.[DateCreated]
		  ,v.[DateModified]
		  ,[UserId]
		  ,TotalCount = COUNT(1) OVER()

	FROM  dbo.Images as i inner join dbo.FriendsV2 as v
				on v.PrimaryImageId = i.Id  

	WHERE (Title LIKE '%' + @Query + '%')

	ORDER BY Id

  OFFSET @offset Rows
  FETCH NEXT @PageSize Rows ONLY

END