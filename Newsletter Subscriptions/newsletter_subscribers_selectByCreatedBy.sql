USE [Flow]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Select_ByCreatedBy]    Script Date: 8/31/2022 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandra Truong
-- Create date: 07/29/2022
-- Description:	Select_ByCreatedBy (paginated) proc for NewsletterSubscriptions
-- Code Reviewer: Daphne Judan


-- MODIFIED BY: Sandra Truong
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: Hector Martinez
-- Note: 
-- =============================================


ALTER PROC [dbo].[NewsletterSubscriptions_Select_ByCreatedBy]
				 @PageIndex int
				,@PageSize int
				,@CreatedBy nvarchar(255) 


/*
	DECLARE  @PageIndex int = 0
			,@PageSize int = 3
			,@CreatedBy nvarchar(255) = 'test@test.com'

	EXECUTE [dbo].[NewsletterSubscriptions_Select_ByCreatedBy]
			 @PageIndex
			,@PageSize
			,@CreatedBy


*/

AS

BEGIN
	DECLARE @offset int = @PageIndex * @PageSize

	SELECT ns.[Email] as CreatedBy
		  ,[IsSubscribed]
		  ,ns.[DateCreated]
		  ,ns.[DateModified]
		  ,TotalCount = COUNT(1) OVER()
	FROM [dbo].[NewsletterSubscriptions] as ns 
			inner join dbo.Users as u
				on ns.Email = u.Email
	WHERE ns.Email = @CreatedBy

	ORDER BY ns.[DateCreated]

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY

END