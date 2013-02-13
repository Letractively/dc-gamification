
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_BY_USER_AND_STATUS]    Script Date: 02/13/2013 15:40:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_BY_USER_AND_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_BY_USER_AND_STATUS]
GO

CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_BY_USER_AND_STATUS]
	@UserKey uniqueidentifier,
	@MissionStatus nvarchar(50)
AS
BEGIN
	IF (@MissionStatus <> 'Failed')
	BEGIN
		SELECT m.MissionId
		,m.Name
		,m.Description
		,m.SkillsRequired
		,u.FullName as Owner
		,mc.ComplexityId as Complexity
		,mc.Reward
		,m.StartDate
		,m.EndDate
		,m.TypeId
		 
		FROM dbo.Missions m
		JOIN dbo.MissionsAssignedToUser mu ON
			mu.MissionId = m.MissionId
			AND mu.UserId = @UserKey
		JOIN dbo.MissionStatus ms ON
			ms.StatusId = m.StatusId
			AND ms.Description = @MissionStatus
		join dbo.MissionComplexity mc ON
			mc.ComplexityId = m.ComplexityId
		JOIN dbo.Users u ON
		u.UserId = m.OwnerId
	END
	ELSE
	BEGIN
		SELECT m.MissionId
		,m.Name
		,m.Description
		,m.SkillsRequired
		,u.FullName as Owner
		,mc.ComplexityId as Complexity
		,mc.Reward
		,m.StartDate
		,m.EndDate
		,m.TypeId
		 
		FROM dbo.Missions m
		JOIN dbo.MissionComplexity mc ON
			mc.ComplexityId = m.ComplexityId
		JOIN dbo.MissionsFailed mf ON
			mf.Failed_id = m.MissionId
			AND mf.UserKey = @UserKey
		JOIN dbo.Users u ON
		u.UserId = m.OwnerId
	END
	
END
GO


