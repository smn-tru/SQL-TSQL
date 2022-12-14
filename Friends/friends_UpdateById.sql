USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Update]    Script Date: 8/31/2022 10:52:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_Update]

			 @Title nvarchar(50)
			,@Bio nvarchar(50)
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@PrimaryImageUrl nvarchar(50)
			,@Id int
			--,@UserId int
			



/*

Declare @Id int= 0;

	Declare 
			@Title nvarchar(50) = 'Mr'
			,@Bio nvarchar(50) = 'Bill Nye'
			,@Summary nvarchar(50) = 'Take a look at this!'
			,@Headline nvarchar(50) ='The Science Guy'
			,@Slug nvarchar(50) = 'billNye'
			,@StatusId int = 1
			,@PrimaryImageUrl nvarchar(50) = 'https://tinyurl.com/mu5xtrb7'
			,@Id int OUTPUT
			--,@UserId int = 11271955

	Select *
	From dbo.Friends
	Where Id = @id

	Execute dbo.Friends_Update
			@Title
			,@Bio
			,@Summary
			,@Headline
			,@Slug
			,@StatusId
			,@PrimaryImageUrl
			,@Id
			--,@UserId

	Select @Id

	Select *
	From dbo.Friends
	Where Id = @id

*/



as

BEGIN
	
	DECLARE @dateNow datetime2 = GETUTCDATE()

	UPDATE [dbo].[Friends]
   SET [Title] = @Title
      ,[Bio] = @Bio
      ,[Summary] = @Summary
      ,[Headline] = @Headline
      ,[Slug] = @Slug
      ,[StatusId] = @StatusId
      ,[PrimaryImageUrl] = @PrimaryImageUrl
      ,[DateModified] = @dateNow
      --,[UserId] = @UserId
 WHERE Id = @Id

END