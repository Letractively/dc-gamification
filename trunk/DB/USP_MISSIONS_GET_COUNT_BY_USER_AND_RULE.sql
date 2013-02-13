
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_COUNT_BY_USER_AND_RULE]    Script Date: 02/13/2013 15:41:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_COUNT_BY_USER_AND_RULE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_COUNT_BY_USER_AND_RULE]
GO


CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_COUNT_BY_USER_AND_RULE]
	@UserKey uniqueidentifier,
	@RuleId int
	
AS
BEGIN
	/* Completed in general */
	IF (@RuleId = 1)
	BEGIN
		SELECT COUNT(*) as missions_count
		FROM dbo.Missions m
		JOIN dbo.MissionsAssignedToUser mu ON
			mu.MissionId = m.MissionId
			AND mu.UserId = @UserKey
		
		JOIN dbo.MissionStatus ms ON
			m.StatusId = ms.StatusId
			AND ms.Description = 'Completed'
	END
	/* Completed in current stage */
	ELSE IF (@RuleId = 2)
	BEGIN
		SELECT COUNT(*) as missions_count
		FROM dbo.Missions m
		JOIN dbo.MissionsAssignedToUser mu ON
			mu.MissionId = m.MissionId
			AND mu.UserId = @UserKey
		
		JOIN dbo.MissionStatus ms ON
			m.StatusId = ms.StatusId
			AND ms.Description = 'Completed'
	END
	/* Failed */
	ELSE IF (@RuleId = 3)
	BEGIN
		SELECT COUNT(*) as missions_count
		FROM dbo.MissionsFailed mf
		WHERE	mf.UserKey = @UserKey
	END	
END
GO


