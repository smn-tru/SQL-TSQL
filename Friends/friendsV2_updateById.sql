USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[FriendsV2_Update]    Script Date: 8/31/2022 10:52:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[FriendsV2_Update]
			@Title nvarchar(50)
			,@Bio nvarchar(50)
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@ImageTypeId int
		    ,@ImageUrl nvarchar(50)
			,@Id int


/*
	Declare @Id int = 13
	Declare @PrimaryImageId int = 21

	Select *
	From dbo.FriendsV2
	Where Id = @Id

	Execute dbo.FriendsV2_Update
		@PrimaryImageId
		,@Id

	Select @Id

	Select *
	From dbo.FriendsV2
	Where Id = @Id



*/


as

BEGIN
	Declare @ImageId int = 0

	INSERT INTO [dbo].Images
				(TypeId
				,[Url])

		 VALUES (@ImageTypeId
				,@ImageUrl)

		 SET @ImageId = SCOPE_IDENTITY()

	UPDATE [dbo].[FriendsV2]
      SET [Title] = @Title
		  ,[Bio] = @Bio
		  ,[Summary] = @Summary
		  ,[Headline] = @Headline
		  ,[Slug] = @Slug
		  ,[StatusId] = @StatusId
		  ,[PrimaryImageId] = @ImageId

 WHERE Id = @Id

END