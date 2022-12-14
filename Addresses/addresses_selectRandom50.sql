USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Sabio_Addresses_SelectRandom50]    Script Date: 8/31/2022 11:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[Sabio_Addresses_SelectRandom50]

/*

	Execute [dbo].[Sabio_Addresses_SelectRandom50]

*/

as
BEGIN

	SELECT top 50 
	      [Id]
		  ,[LineOne]
		  ,[SuiteNumber]
		  ,[City]
		  ,[State]
		  ,[PostalCode]
		  ,[IsActive]
		  ,[Lat]
		  ,[Long]
	  FROM [dbo].[Sabio_Addresses]
	  Order By NEWID()

END



