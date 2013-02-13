
/****** Object:  StoredProcedure [dbo].[USP_MISSION_DROP_BY_USER]    Script Date: 02/13/2013 15:38:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSION_DROP_BY_USER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSION_DROP_BY_USER]
GO


CREATE PROCEDURE [dbo].[USP_MISSION_DROP_BY_USER]
	@UserKey uniqueidentifier
AS
BEGIN
	DECLARE 
	@CurrentMissioniId int,
	@StatusActiveId int
	
	Select @StatusActiveId = StatusId
	FROM
	dbo.MissionStatus
	WHERE Description = 'Active'
	
	SELECT 
		@CurrentMissioniId = m.MissionId
	FROM 
	dbo.Missions m
	JOIN dbo.MissionStatus ms ON
		m.StatusId = ms.StatusId
		AND ms.Description = 'In Progress'
	JOIN dbo.MissionsAssignedToUser mu ON
		mu.MissionId = m.MissionId
		AND mu.UserId = @UserKey
	
	INSERT INTO dbo.MissionsFailed (Failed_Id, Drop_Date, UserKey)
	VALUES(@CurrentMissioniId, GETDATE(), @UserKey)
	
	UPDATE dbo.Missions
	SET StatusId = @StatusActiveId
	WHERE MissionId = @CurrentMissioniId
	
	DELETE FROM dbo.MissionsAssignedToUser
	WHERE MissionId = @CurrentMissioniId
	AND UserId = @UserKey
	
	/* Update Statistincs */
	EXEC dbo.USP_STATISTICS_UPDATE 
      @UserId = @UserKey
      ,@FailedMissions = 1
END
GO


