USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Sabio_Addresses_Update]    Script Date: 8/31/2022 11:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[Sabio_Addresses_Update]
			@Id int,
			@LineOne nvarchar(50),
			@SuiteNumber int,
			@City nvarchar(50),
			@State nvarchar(50),
			@PostalCode nvarchar(50),
			@IsActive bit,
			@Lat float,
			@Long float
as

BEGIN

	UPDATE [dbo].[Sabio_Addresses]
	   SET [LineOne]		= @LineOne
		  ,[SuiteNumber]	= @SuiteNumber
		  ,[City]			= @City
		  ,[State]			= @State
		  ,[PostalCode]		= @PostalCode
		  ,[IsActive]		= @IsActive
		  ,[Lat]			= @Lat
		  ,[Long]			= @Long
	 WHERE Id = @Id


END


