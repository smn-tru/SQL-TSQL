USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 8/31/2022 11:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Users_Update]
		    @Id int 
		   ,@FirstName nvarchar(50)
           ,@LastName nvarchar(50)
           ,@Email nvarchar(50)
           ,@AvatarUrl nvarchar(50)
           ,@TenantId nvarchar(50)
           ,@Password nvarchar(50)
		   ,@PasswordConfirm nvarchar(50)

				

/*

	Declare @Id int = 0;

	Declare @FirstName nvarchar(50) = 'Sandy'
           ,@LastName nvarchar(50) = 'Cheeks'
           ,@Email nvarchar(50) = 'sandycheeks@test.com'
           ,@AvatarUrl nvarchar(50) = 'https://tinyurl.com/yc637mjc'
           ,@TenantId nvarchar(50) = '61790'
           ,@Password nvarchar(50) = '$abioStudent118'
		   ,@PasswordConfirm nvarchar(50) = '$abioStudent118'
		    
	Select *
	From dbo.Users
	Where Id = @Id


	Execute dbo.Users_Update
			@Id
		   ,@FirstName
           ,@LastName
           ,@Email
           ,@AvatarUrl
           ,@TenantId
           ,@Password
		   ,@PasswordConfirm



	Select @Id

	Select *
	From dbo.Users
	Where Id = @Id

*/

as

BEGIN

	DECLARE @dateNow datetime2 = GETUTCDATE()

	UPDATE [dbo].[Users]
   SET 
	   [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Email] = @Email
      ,[AvatarUrl] = @AvatarUrl	
      ,[TenantId] = @TenantId
      ,[Password] = @Password
      ,[DateModified] = @dateNow
 WHERE Id = @Id

END