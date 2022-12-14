USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Cars_SelectById]    Script Date: 8/31/2022 10:46:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER proc [dbo].[Cars_SelectById]
		@Id int

as

/*
	Declare @Id int = 2;

	Execute dbo.[Cars_SelectById] @Id

*/

BEGIN

	SELECT [Id]
		  ,[Make]
		  ,[Model]
		  ,[DateAdded]
		  ,[DateModified]
		  ,[UserId]
	FROM [dbo].[Cars]
	Where Id = @Id

END