USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectAllV3]    Script Date: 8/31/2022 10:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROC [dbo].[Friends_SelectAllV3]
			


/*

	Execute dbo.Friends_SelectAllV3

*/

AS

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
		  ,Skills = ( 
				Select s.Id as SkillsId
					  ,s.Name as SkillsName
				From dbo.Skills as s inner join FriendsV2 as v
					on v.Id = s.Id
				For JSON AUTO
				)
	FROM  dbo.Images as i inner join dbo.FriendsV2 as v
		on v.PrimaryImageId = i.Id 

END



