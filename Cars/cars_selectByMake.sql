USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Cars_SelectByMake]    Script Date: 8/31/2022 10:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER proc [dbo].[Cars_SelectByMake]
		@Make nvarchar(50)

as

/*
	Declare @Make nvarchar(50) = 'Porsche';

	Execute dbo.[Cars_SelectByMake] @Make

*/

BEGIN

	SELECT [Id]
		  ,[Make]
		  ,[Model]
		  ,[DateAdded]
		  ,[DateModified]
		  ,[UserId]
	FROM [dbo].[Cars]
	Where ([Make] = @Make)
		OR
			(@Make IS NULL AND [Make] IS NULL)

END