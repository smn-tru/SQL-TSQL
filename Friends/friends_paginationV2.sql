USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_PaginationV2]    Script Date: 8/31/2022 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_PaginationV2]
		 @PageIndex int
		,@PageSize int


/*
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
		on i.Id = v.PrimaryImageId
  ORDER BY Id

	OFFSET 0 ROWS
	FETCH NEXT 5 ROWS ONLY


*/


as

BEGIN

	Declare @offset int = @PageIndex * @PageSize

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
	ORDER BY Id

  OFFSET @offSet Rows
  Fetch Next @PageSize Rows ONLY

END