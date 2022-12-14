USE [Flow]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_SelectAll]    Script Date: 8/31/2022 10:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandra Truong
-- Create date: 07/29/2022
-- Description:	Select_All (paginated) proc for NewsletterSubscriptions
-- Code Reviewer: Daphne Judan


-- MODIFIED BY: Sandra Truong
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: Hector Martinez
-- Note: 
-- =============================================

ALTER PROC [dbo].[NewsletterSubscriptions_SelectAll]
					  @PageIndex int
					 ,@PageSize int


/*
	DECLARE  @PageIndex int = 0
			,@PageSize int = 5

	DECLARE @offset int = @PageIndex * @PageSize

	SELECT ns.[Email]
		  ,[IsSubscribed]
		  ,ns.[DateCreated]
		  ,ns.[DateModified]
		  ,TotalCount = COUNT(1) OVER()
	FROM [dbo].[NewsletterSubscriptions] as ns 
			inner join dbo.Users as u
			on u.Email = ns.Email
	WHERE u.Email = ns.Email

	ORDER BY ns.Email

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY;


*/



AS

BEGIN

	DECLARE @offset int = @PageIndex * @PageSize

	
	SELECT ns.[Email]
		  ,[IsSubscribed]
		  ,ns.[DateCreated]
		  ,ns.[DateModified]
		  ,TotalCount = COUNT(1) OVER()
	FROM [dbo].[NewsletterSubscriptions] as ns 
			inner join dbo.Users as u
			on u.Email = ns.Email
	WHERE u.Email = ns.Email

	ORDER BY ns.Email

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY;

END