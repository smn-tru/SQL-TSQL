USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Sabio_Addresses_DeleteById]    Script Date: 8/31/2022 11:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[Sabio_Addresses_DeleteById]
			@Id int
/*

	declare @Id int = 10
	Execute [dbo].[Sabio_Addresses_DeleteById] @Id

*/

as
BEGIN

	  DELETE
	  FROM [dbo].[Sabio_Addresses]
	  Where Id = @Id

END



