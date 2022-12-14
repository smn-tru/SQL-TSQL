USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Pagination]    Script Date: 8/31/2022 11:01:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Users_Pagination]
			@PageIndex int
			,@PageSize int

/*
	SELECT *
	FROM	dbo.Users

	ORDER BY
			Id

	OFFSET 0 ROWS
	FETCH NEXT 2 ROWS ONLY


*/

as


BEGIN

	Declare @offset int = @PageIndex * @PageSize
		
	SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[AvatarUrl]
      ,[TenantId]
      ,[Password]
      ,[DateCreated]
      ,[DateModified]
		, TotalCount = COUNT(1) OVER()
	FROM dbo.Users

	ORDER BY Id

	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY

END