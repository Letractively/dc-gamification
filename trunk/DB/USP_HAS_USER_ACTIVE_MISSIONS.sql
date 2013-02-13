
/****** Object:  StoredProcedure [dbo].[USP_HAS_USER_ACTIVE_MISSIONS]    Script Date: 02/13/2013 15:36:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_HAS_USER_ACTIVE_MISSIONS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_HAS_USER_ACTIVE_MISSIONS]
GO


CREATE PROCEDURE [dbo].[USP_HAS_USER_ACTIVE_MISSIONS]
	@UserGuid uniqueidentifier
AS
BEGIN
	IF( EXISTS (
		SELECT * 
		FROM dbo.MissionsAssignedToUser mu
		JOIN dbo.Missions m ON
			m.MissionId = mu.MissionId
		JOIN dbo.MissionStatus	ms ON
			ms.StatusId = m.StatusId
			AND ms.Description in ('In Progress')
		WHERE mu.UserId = @UserGuid))
		SELECT 1
	ELSE
		SELECT 0
END

GO


