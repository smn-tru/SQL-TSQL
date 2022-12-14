USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Cars_Update]    Script Date: 8/31/2022 10:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER proc [dbo].[Cars_Update]
		@CarMake nvarchar(50)
		,@CarModel nvarchar(50)
		,@UserId nvarchar(128)
		,@Id int 

as

/*-----Test Code is required-----

	Declare @Id int = 1;

	Declare @CarMake nvarchar(50) = 'Audi'
			,@CarModel nvarchar(50) = 'RS6'
			,@UserId nvarchar(128) = '123456'

	Select *
		From dbo.Cars
		Where Id = @Id 
			

	Execute dbo.Cars_Update
							@CarMake 
							,@CarModel 
							,@UserId
							,@Id 

		Select @Id

		Select *
		From dbo.Cars
		Where Id = @Id


*/


BEGIN
	Declare @dateNow datetime2 = getutcdate()

	UPDATE [dbo].[Cars]
	   SET [Make] = @CarMake
		  ,[Model] = @CarModel

		  ,[DateModified] = @dateNow
		  ,[UserId] = @UserId
	 WHERE Id = @Id


END