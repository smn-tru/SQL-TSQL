USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Insert]    Script Date: 8/31/2022 10:51:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Friends_Insert]
			
			@Title nvarchar(50)
			,@Bio nvarchar(50)
			,@Summary nvarchar(50)
			,@Headline nvarchar(50)
			,@Slug nvarchar(50)
			,@StatusId int
			,@PrimaryImageUrl nvarchar(50)
			,@Id int OUTPUT

/*

	Declare @Id int= 5;

	Declare 
			@Title nvarchar(50) = 'Mr'
			,@Bio nvarchar(50) = 'Ash Ketchum'
			,@Summary nvarchar(50) = 'I want to be the very best'
			,@Headline nvarchar(50) ='Gotta Catch em All'
			,@Slug nvarchar(50) = 'ashKetchum'
			,@StatusId int = 1
			,@PrimaryImageUrl nvarchar(50) = 'https://tinyurl.com/2rntu46u'


	Execute dbo.Friends_Insert
			@Title
			,@Bio
			,@Summary
			,@Headline
			,@Slug
			,@StatusId
			,@PrimaryImageUrl


	

	Select *
	From dbo.Friends
	Where Id = @id




*/


as

BEGIN

	INSERT INTO [dbo].[Friends]
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId]
           ,[PrimaryImageUrl]
		   )
     VALUES
           (@Title
			,@Bio
			,@Summary
			,@Headline
			,@Slug
			,@StatusId
			,@PrimaryImageUrl
			)

	SET @Id = SCOPE_IDENTITY()

END