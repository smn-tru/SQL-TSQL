USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Delete]    Script Date: 8/31/2022 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_Delete]
		@Id int 

/*

	Declare @Id int = 157;

	Select *
	From dbo.Friends
	Where Id = @Id

	Execute dbo.Friends_Delete @Id

	Select *
	From dbo.Friends
	Where Id = @Id

*/



as

BEGIN

	DELETE FROM [dbo].[Friends]
      WHERE Id = @Id

END