USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Skills_InsertBatchV2]    Script Date: 8/31/2022 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Skills_InsertBatchV2]
		 @batchSkills dbo.SkillsV2 READONLY
		--,@dateMod datetime2

/*

	Declare @newSkills dbo.SkillsV2

	Insert into @newSkills(Id, Name)
	Values( 10, 'SQL')

	Insert into @newSkills(Id, Name)
	Values( 22, 'Ruby')


	Execute dbo.[Skills_InsertBatchV2] @newSkills

	select *
	from dbo.Skills



*/


AS

BEGIN
	
	UPDATE dbo.Skills
		SET  Name = b.Name
			--,DateModified = @dateMod
		FROM @batchSkills as b inner join dbo.Skills as s
			on s.Id = b.Id

	SET IDENTITY_INSERT dbo.Skills ON

	INSERT INTO dbo.Skills (Id
						 , Name)
						 

	SELECT	 b.Id
			,b.Name
			--,@dateMod
	FROM @batchSkills as b
	WHERE Not Exists ( Select 1
						From dbo.Skills as s
						Where s.Id = b.Id)

	SET IDENTITY_INSERT dbo.Skills OFF

END