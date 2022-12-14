USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Cars_Insert]    Script Date: 8/31/2022 10:46:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Cars_Insert]

		@CarMake nvarchar(50)
		,@CarModel nvarchar(50)
		,@UserId nvarchar(128)
		,@Id int OUTPUT

/* -----Test Code---Need to have this---

	Declare @Id int = 0;

	Declare @CarMake nvarchar(50) = 'Audi'
			,@CarModel nvarchar(50) = 'RS6'
			,@UserId nvarchar(128) = '09876'
			

	Execute dbo.Cars_Insert
							@CarMake 
							,@CarModel 
							,@UserId
							,@Id OUTPUT

		Select @Id

		Select *
		From dbo.Cars
		Where Id = @Id

*/

as

BEGIN



	INSERT INTO [dbo].[Cars]
				([Make]
				,[Model]
				,[UserId])
		VALUES
				(@CarMake
				,@CarModel 
				,@UserId)
		SET @Id = SCOPE_IDENTITY()

END	