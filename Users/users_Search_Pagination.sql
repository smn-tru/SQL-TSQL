USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Search_Pagination]    Script Date: 8/31/2022 11:01:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[Users_Search_Pagination]
				 @PageIndex int
				,@PageSize int
				,@Query nvarchar(50)
				


/*
	Declare @PageIndex int = 0
	Declare @PageSize int = 5
	Declare @Query nvarchar(50) = 'Sanny'

	Select	*

	FROM	dbo.Users

	Where (FirstName LIKE '%' + @Query + '%')



*/

as

BEGIN
	
	Declare @offset int = @PageIndex * @PageSize

	SELECT 
	   [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[AvatarUrl]
      ,[TenantId]
      ,[Password]
      ,[DateCreated]
      ,[DateModified]


	FROM [dbo].[Users]
	Where (FirstName LIKE '%' + @Query + '%') 
	ORDER BY FirstName
	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY



END