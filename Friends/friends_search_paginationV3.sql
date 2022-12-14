USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV3]    Script Date: 8/31/2022 10:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [dbo].[Friends_Search_PaginationV3]
				 @PageIndex int
				,@PageSize int
				,@Query nvarchar(50)

/*
	DECLARE  @PageIndex int = 0
			,@PageSize int = 5
			,@Query nvarchar(5) = 'Ms'

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
	WHERE (Title LIKE '%' + @Query + '%')

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

	WHERE (Title LIKE '%' + @Query + '%')

	ORDER BY Id

	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY

END



