
/****** Object:  StoredProcedure [dbo].[USP_STATISTICS_UPDATE]    Script Date: 02/13/2013 15:45:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_STATISTICS_UPDATE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_STATISTICS_UPDATE]
GO


CREATE PROCEDURE [dbo].[USP_STATISTICS_UPDATE]
	@UserId uniqueidentifier
	,@LoginsCount int = 0
	,@CompletedMissions int = 0
	,@FailedMissions int = 0
	,@CreatedMissions int = 0
	,@Expirience int = 0
	,@Points int = 0
	,@NumberCompletedStages int = 0
	,@UnlockedBadges int = 0
	,@UnlockedUniqueBadges int = 0
	,@MediumMissionsCompleted int = 0
	,@HighMissionCompleted int = 0
	,@EasyMissionsCompleted int = 0
	,@CHECK_REWARDS bit = 1
AS
BEGIN
	
	DECLARE @CurrentStageId int
	SELECT TOP 1 @CurrentStageId = StageId
	FROM dbo.Stages s 
	WHERE IsCurrent = 1
	
	UPDATE dbo.UsersStageStatistics
	SET 
      CompletedMissions = CompletedMissions + @CompletedMissions
      ,FailedMissions = FailedMissions + @FailedMissions
      ,CreatedMissions = CreatedMissions + @CreatedMissions
      ,MediumMissionsCompleted = MediumMissionsCompleted + @MediumMissionsCompleted
      ,HighMissionCompleted = HighMissionCompleted + @HighMissionCompleted
      ,EasyMissionsCompleted = EasyMissionsCompleted + @EasyMissionsCompleted
      ,Experience = Experience + @Expirience
      ,Points = Points + @Points
      ,UnlockedBadges = UnlockedBadges + @UnlockedBadges
      ,UnlockedUniqueBadges = UnlockedUniqueBadges + @UnlockedUniqueBadges
	WHERE 
		StageId = @CurrentStageId
		AND UserId = @UserId
		
	UPDATE dbo.UsersStatistics
	SET
		LoginsCount = LoginsCount + @LoginsCount
		,CompletedMissions = CompletedMissions + @CompletedMissions
		,FailedMissions = FailedMissions + @FailedMissions
		,CreatedMissions = CreatedMissions + @CreatedMissions
		,EasyMissionsCompleted = EasyMissionsCompleted + @EasyMissionsCompleted
		,MediumMissionsCompleted = MediumMissionsCompleted + @MediumMissionsCompleted
		,HighMissionCompleted = HighMissionCompleted + @HighMissionCompleted
		,Experience = Experience + @Expirience
		,Points = Points + @Points
		,UnlockedBadges = UnlockedBadges + @UnlockedBadges
		,UnlockedUniqueBadges = UnlockedUniqueBadges + @UnlockedUniqueBadges
	WHERE 
		UserId = @UserId	
	
	/* calculate in top periods */
	
	DECLARE 
		@TopUserIdNew uniqueidentifier
		,@TopUserIdOld uniqueidentifier
			
	SELECT TOP 1 
		@TopUserIdNew = UserId
	FROM dbo.UsersStatistics 
	WHERE Experience > 0
	ORDER BY Experience DESC
	
	SELECT TOP 1 
		@TopUserIdOld = UserId
	FROM dbo.UsersStatistics 
	WHERE 
		Experience > 0
		AND InTopStartDate IS NOT NULL
		AND InTopEndDate IS NULL
	
	IF (ISNULL(@TopUserIdNew, '00000000-0000-0000-0000-000000000000') != ISNULL(@TopUserIdOld, '00000000-0000-0000-0000-000000000000'))
	BEGIN
		UPDATE  dbo.UsersStatistics
			SET 
				InTopEndDate = GETDATE()
				,InTopDuration = ISNULL(InTopDuration, 0) + (GETDATE() - InTopStartDate)
			
		WHERE
			UserId = @TopUserIdOld
		
		UPDATE  dbo.UsersStatistics
			SET 
				InTopEndDate = NULL
				,InTopStartDate = GETDATE()
		WHERE
			UserId = @TopUserIdNew
	END
	
	
	IF (@CHECK_REWARDS = 1)	
	BEGIN
		exec dbo.USP_GRANT_REVARDS @UserId
	END	
END
GO


