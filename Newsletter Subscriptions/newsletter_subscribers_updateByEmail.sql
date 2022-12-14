USE [Flow]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Update]    Script Date: 8/31/2022 10:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandra Truong
-- Create date: 07/28/2022
-- Description:	Update proc for NewsletterSubscriptions
-- Code Reviewer: Daphne Judan


-- MODIFIED BY: Sandra Truong
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: Hector Martinez
-- Note: 
-- =============================================

ALTER PROC [dbo].[NewsletterSubscriptions_Update]
				 @Email nvarchar(255)
				,@IsSubscribed bit
				


/*
	DECLARE @Email nvarchar(255) = 'Test@example.com'


	DECLARE @IsSubscribed bit = 0
	
	SELECT *
	FROM dbo.NewsletterSubscriptions
	WHERE Email = @Email

	EXECUTE dbo.NewsletterSubscriptions_Update
			 @Email
			,@IsSubscribed


	SELECT *
	FROM dbo.NewsletterSubscriptions
	WHERE Email = @Email





*/

AS

BEGIN
	
	DECLARE @dateNow datetime2 = GETUTCDATE()

	UPDATE [dbo].[NewsletterSubscriptions]
	
    SET  [IsSubscribed] = @IsSubscribed
        ,[DateModified] = @dateNow

	WHERE Email = @Email

END