USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_InsertV2]    Script Date: 8/31/2022 10:51:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER   PROC [dbo].[Friends_InsertV2]
		    @Title nvarchar(50)
           ,@Bio nvarchar(50)
           ,@Summary nvarchar(50)
           ,@Headline nvarchar(50)
           ,@Slug nvarchar(50)
		   ,@StatusId int
		   ,@ImageTypeId int
		   ,@ImageUrl nvarchar(50)
           --,@UserId int
		   ,@Id int OUTPUT

/*-----TEST CODE---------
	
	Declare @Id int = 0

	Declare 
		    @Title nvarchar(50) = 'Mr'
           ,@Bio nvarchar(50) = 'Cookie Monster'
           ,@Summary nvarchar(50) = 'My real name is Sid'
           ,@Headline nvarchar(50) = 'Me Love to Eat Cookies'
           ,@Slug nvarchar(50) = 'cookieMonster'
           ,@StatusId int = 1
		   ,@ImageTypeId int = 1
		   ,@ImageUrl nvarchar(50) = 'https://tinyurl.com/cnjhzhcw'
           ,@UserId int = 11021969


	Execute dbo.Friends_InsertV2
		    @Title 
           ,@Bio
           ,@Summary
           ,@Headline
           ,@Slug
		   ,@StatusId
		   ,@ImageTypeId
		   ,@ImageUrl
           ,@UserId
		   ,@Id 

	Select @Id

	Select *
	From dbo.FriendsV2
	Where Id = @Id

*/-----TEST CODE---------

AS

BEGIN

	Declare @ImageId int = 0

	INSERT INTO [dbo].Images
				(TypeId
				,[Url])

		 VALUES (@ImageTypeId
				,@ImageUrl)

		 SET @ImageId = SCOPE_IDENTITY()

	INSERT INTO dbo.FriendsV2
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId]
		   --,[UserId]
           ,[PrimaryImageId])
		VALUES
           (@Title
           ,@Bio
           ,@Summary
           ,@Headline
           ,@Slug
           ,@StatusId
           --,@UserId
		   ,@ImageId)

		SET @Id = SCOPE_IDENTITY()

END