

/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_IS_USER_LIMIT_DEPLETED]    Script Date: 02/13/2013 15:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_IS_USER_LIMIT_DEPLETED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_IS_USER_LIMIT_DEPLETED]
GO


CREATE PROCEDURE [dbo].[USP_MISSIONS_IS_USER_LIMIT_DEPLETED]
	@UserId uniqueidentifier
AS
BEGIN
	IF (EXISTS 
		(SELECT * FROM dbo.MissionsAssignedToUser m
		JOIN dbo.Missions mis ON
			mis.MissionId = m.MissionId
		JOIN dbo.MissionStatus mst ON
		 mst.StatusId = mis.StatusId
		 AND mst.Description = 'In Progress'
		 WHERE m.UserId = @UserId)
		)
		SELECT 1 -- limit is depleted, only one mission is allowed in progress status
	ELSE
		SELECT 0 -- user is allowed to take mission
    
END
GO


