USE [C118_sandrat1790_gmail]
GO
/****** Object:  StoredProcedure [dbo].[FriendSkills_InsertBatch]    Script Date: 8/31/2022 10:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [dbo].[FriendSkills_InsertBatch]
			@batchFriendSkills dbo.FriendSkills READONLY

/*
	Declare @newFriendSkills dbo.FriendSkills

	Insert into @newFriendSkills(FriendId, SkillId)
	Values(137, 8)

	Insert into @newFriendSkills(FriendId, SkillId)
	Values(4,6)

	Execute dbo.[FriendSkills_InsertBatch] @newFriendSkills

	select *
	from dbo.FriendSkills

	


*/

AS

BEGIN

	UPDATE dbo.FriendSkills
		SET FriendId = f.Id
			,SkillId = s.Id
	FROM @batchFriendSkills as b inner join dbo.FriendsV2 as f
			on f.Id = b.FriendId
			inner join dbo.Skills as s
				on s.Id = b.SkillId

	--SET IDENTITY_INSERT dbo.FriendSkills ON

	INSERT INTO dbo.FriendSkills(FriendId,SkillId)

	SELECT b.FriendId
		  ,b.SkillId
	FROM @batchFriendSkills as b
	WHERE Not Exists ( SELECT 1
						FROM dbo.FriendSkills as fs
						WHERE fs.FriendId = b.FriendId)


	--SET IDENTITY_INSERT dbo.FriendSkills OFF

END