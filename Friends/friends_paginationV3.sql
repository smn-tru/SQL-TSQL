USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_PaginationV3]    Script Date: 8/31/2022 10:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Friends_PaginationV3]
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
		  ,Skills = ( 
				Select s.Id as SkillsId
					  ,s.Name as SkillsName
				From dbo.Skills as s inner join FriendsV2 as v
					on v.Id = s.Id
				For JSON AUTO
				)
	FROM  dbo.Images as i inner join dbo.FriendsV2 as v
		on v.PrimaryImageId = i.Id
	ORDER BY Id

	OFFSET 0 ROWS
	FETCH NEXT 5 ROWS ONLY


*/

AS

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
		  ,Skills = ( 
				Select s.Id as SkillsId
					  ,s.Name as SkillsName
				From dbo.Skills as s inner join FriendsV2 as v
					on v.Id = s.Id
				For JSON AUTO
				)
			,TotalCount = COUNT(1) OVER()
	FROM  dbo.Images as i inner join dbo.FriendsV2 as v
		on v.PrimaryImageId = i.Id
	ORDER BY Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

END