USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectById]    Script Date: 8/31/2022 10:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_SelectById]
				@Id int


/*
	Declare @Id int = 3;

	Execute dbo.[Friends_SelectById] @Id


*/



as

BEGIN

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
  FROM [dbo].[Friends]
  Where Id = @Id

END