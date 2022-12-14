USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Images_Insert]    Script Date: 8/31/2022 11:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Images_Insert]
		@TypeId int
		,@Url nvarchar(50)
		,@Id int OUTPUT

		


/*
	Declare @Id int = 46741
	Declare @TypeId int = 1
	Declare @Url nvarchar(50) = 'https://tinyurl.com/cnjhzhcw'

	Execute dbo.Images_Insert
		@TypeId 
		,@Url 
		,@Id 
	

	Select *
	From dbo.Images
	Where Id = @Id



*/


as

BEGIN

	INSERT INTO [dbo].[Images]
           ([TypeId]
           ,[Url])
     VALUES
           (@TypeId
           ,@Url)

	SET @Id = SCOPE_IDENTITY()

END