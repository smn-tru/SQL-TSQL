USE [Flow]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Insert]    Script Date: 8/31/2022 10:35:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandra Truong
-- Create date: 07/28/2022
-- Description:	Insert Proc for NewsletterSubscriptions 
-- Code Reviewer: Daphne Judan


-- MODIFIED BY: Sandra Truong
-- MODIFIED DATE: 08/03/2022
-- Code Reviewer: Hector Martinez
-- Note: 
-- =============================================



ALTER PROC [dbo].[NewsletterSubscriptions_Insert]
			@Email nvarchar(255)
           ,@IsSubscribed bit = 1

		   
		   

/*


	DECLARE		 @Email nvarchar(255) = 'test523234@test.com'
				,@IsSubscribed bit = 1

	EXECUTE dbo.NewsletterSubscriptions_Insert
				 @Email
				,@IsSubscribed


	SELECT *
	FROM dbo.NewsletterSubscriptions





*/

AS

BEGIN

	INSERT INTO [dbo].[NewsletterSubscriptions]
           ([Email]
           ,[IsSubscribed])

     VALUES
           (@Email
           ,@IsSubscribed)

END

