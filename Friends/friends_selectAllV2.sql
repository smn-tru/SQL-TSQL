USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectAllV2]    Script Date: 8/31/2022 10:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [dbo].[Friends_SelectAllV2]

/*

Execute dbo.Friends_SelectAllV2

*/

as

BEGIN

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
	FROM  dbo.Images as i inner join dbo.FriendsV2 as v
		on v.PrimaryImageId = i.Id 
	--Where v.Id = @Id

END