
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_CHECK_DEAD_LINE]    Script Date: 02/13/2013 15:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_CHECK_DEAD_LINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_CHECK_DEAD_LINE]
GO

CREATE PROCEDURE [dbo].[USP_MISSIONS_CHECK_DEAD_LINE]
	
AS
BEGIN
		DECLARE @CURRENT_DATE as DateTime
		SELECT @CURRENT_DATE = GETDATE()

		DECLARE @FailedMission TABLE (MissionId INT, UserId uniqueidentifier, OwnerId uniqueidentifier, OwnerName varchar(50))
		DECLARE @CanceledMission Table (MissionId int, UserId uniqueidentifier, OwnerId uniqueidentifier, OwnerName varchar(50))

		INSERT INTO @FailedMission(MissionId, UserId, OwnerId, OwnerName )
		SELECT m.MissionId
				,users.UserId as UserId
				,owners.UserId as OwnerId
				,owners.UserName as OwnerName
		FROM dbo.Missions m
		JOIN dbo.MissionStatus ms ON
			ms.StatusId = m.StatusId
			AND ms.Description = 'In Progress'
		JOIN dbo.Users owners ON
			owners.UserId = m.OwnerId
			
		JOIN dbo.MissionsAssignedToUser mu ON
			mu.MissionId = m.MissionId
		JOIN dbo.Users users ON
			users.UserId = mu.UserId
		WHERE m.EndDate < @CURRENT_DATE
		
		
		INSERT INTO @CanceledMission(MissionId, UserId, OwnerId, OwnerName)
		SELECT m.MissionId
				,null as UserId
				,owners.UserId as OwnerId
				,owners.UserName as OwnerName
		FROM dbo.Missions m
		JOIN dbo.MissionStatus ms ON
			ms.StatusId = m.StatusId
			AND ms.Description = 'Active'
		JOIN dbo.Users owners ON
			owners.UserId = m.OwnerId
		WHERE m.EndDate < @CURRENT_DATE
		
		/* Process Canceled Missions */
		DECLARE @CanseledStatusId int
		SELECT @CanseledStatusId = StatusId 
		FROM dbo.MissionStatus 
		WHERE Description = 'Canceled'
		
		UPDATE dbo.Missions
		SET StatusId = @CanseledStatusId
		WHERE MissionId in (SELECT MissionId FROM @CanceledMission)
		
		/* Process Failed */
		DECLARE @FailedStatusId int
		SELECT @FailedStatusId = StatusId 
		FROM dbo.MissionStatus 
		WHERE Description = 'Failed'
		
		UPDATE dbo.Missions
		SET StatusId = @FailedStatusId
		WHERE MissionId in (SELECT MissionId FROM @FailedMission)
		
		INSERT INTO dbo.MissionsFailed (Failed_Id, Drop_Date, UserKey)
		SELECT MissionId, GETDATE(), UserId
		FROM @FailedMission
		
	
		DELETE FROM dbo.MissionsAssignedToUser
		WHERE UserId in (SELECT UserId FROM @FailedMission) 
		
		
		
		/* Return Results */
		SELECT MissionId, UserId, OwnerId, OwnerName, 'Canceled' as Reasons
		FROM @CanceledMission
		UNION ALL 
		SELECT MissionId, UserId, OwnerId, OwnerName, 'Failed' as Reasons
		FROM @FailedMission
		
		
END
GO


