USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Images_Delete]    Script Date: 8/31/2022 11:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Images_Delete]
				@Id int

/*
	Declare @Id int = 14 

		Select *
		From dbo.Images
		WHERE Id = @Id

		Execute dbo.Images_Delete @Id

		Select *
		From dbo.Images
		WHERE Id = @Id


*/

as

BEGIN

	DELETE FROM [dbo].[Images]
      WHERE Id = @Id

END