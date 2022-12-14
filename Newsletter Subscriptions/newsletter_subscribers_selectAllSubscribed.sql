USE [Flow]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_SelectAll_Subscribed]    Script Date: 8/31/2022 10:36:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandra Truong
-- Create date: 07/29/2022
-- Description:	SelectAll_Subscribed (not paginated) proc for NewsletterSubscriptions
-- Code Reviewer: Daphne Judan


-- MODIFIED BY: Sandra Truong
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: Hector Martinez
-- Note: 
-- =============================================

ALTER PROC [dbo].[NewsletterSubscriptions_SelectAll_Subscribed]
					@IsSubscribed bit = 1

/*

	DECLARE @IsSubscribed bit = 1;

	EXECUTE dbo.[NewsletterSubscriptions_SelectAll_Subscribed] @IsSubscribed

*/



AS

BEGIN
	


	SELECT [Email]
		  ,[IsSubscribed]
		  ,[DateCreated] 
		  ,[DateModified]
		  ,TotalCount = COUNT(1) OVER()
		  
	FROM [dbo].[NewsletterSubscriptions]

	WHERE IsSubscribed = @IsSubscribed
	ORDER BY DateCreated DESC

END