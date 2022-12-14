USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 8/31/2022 11:01:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER   PROC [dbo].[Users_Insert]
			@FirstName nvarchar(50)
           ,@LastName nvarchar(50)
           ,@Email nvarchar(50)
           ,@AvatarUrl nvarchar(50)
           ,@TenantId nvarchar(50)
           ,@Password nvarchar(50)
		   ,@PasswordConfirm nvarchar(50)
		   ,@Id int OUTPUT
		

/*
	 

	Declare @Id int = 0;

	Declare @FirstName nvarchar(50) = 'Peter'
           ,@LastName nvarchar(50) = 'Parker'
           ,@Email nvarchar(50) = 'petersemail@test.com'
           ,@AvatarUrl nvarchar(50) = 'https://tinyurl.com/434hw9vc'
           ,@TenantId nvarchar(50) = '34565'
           ,@Password nvarchar(50) = 'iamSpiderMan1!'
		   ,@PasswordConfirm nvarchar(50) = 'iamSpiderMan1!'

	Execute dbo.Users_Insert
		    @FirstName
           ,@LastName
           ,@Email
           ,@AvatarUrl
           ,@TenantId
           ,@Password
		   ,@PasswordConfirm
		   ,@Id


	Select @Id

	Select *
	From dbo.Users
	Where Id = @Id

*/


as

BEGIN

	INSERT INTO [dbo].[Users]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[AvatarUrl]
           ,[TenantId]
           ,[Password]
		   ,[PasswordConfirm])

     VALUES
           (@FirstName
           ,@LastName
           ,@Email
           ,@AvatarUrl
           ,@TenantId
           ,@Password
		   ,@PasswordConfirm)

	SET @Id = SCOPE_IDENTITY()

END