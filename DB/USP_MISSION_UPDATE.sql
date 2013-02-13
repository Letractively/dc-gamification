
/****** Object:  StoredProcedure [dbo].[USP_MISSION_UPDATE]    Script Date: 02/13/2013 15:38:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSION_UPDATE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSION_UPDATE]
GO


CREATE PROCEDURE [dbo].[USP_MISSION_UPDATE]
	@MissionId int
	,@Name nvarchar(250)
	,@Description nvarchar(max)
	,@PlayerType nvarchar(10)
	,@OwnerId uniqueidentifier
	,@StartDate date
	,@EndDate date
	,@SkillRequired nvarchar(250)
	,@StatusId int
	,@TypeId int
	,@ComplexityId int
	,@StageId int										
AS
BEGIN
	UPDATE [dbo].[Missions]
	SET [Name] = @Name
      ,[Description] = @Description
      ,[PlayerType] = @PlayerType
      ,[OwnerId] = @OwnerId
      ,[StartDate] = @StartDate
      ,[EndDate] = @EndDate
      ,[SkillsRequired] = @SkillRequired
      ,[StatusId] = @StatusId
      ,[TypeId] = @TypeId
      ,[ComplexityId] = @ComplexityId
      ,StageId = @StageId
      WHERE MissionId = @MissionId
      
    IF (@StatusId in (SELECT StatusID FROM dbo.MissionStatus WHERE Description = 'Completed'))
    BEGIN
		/* mission is completed and we should update user statistics*/
		DECLARE 
			@UserKey uniqueidentifier
			,@PointsAmount int
			,@ExpirienceAmount int
			,@EasyMission int
			,@MediumMission int
			,@HighMission int	
			
		SELECT @UserKey = UserId
		FROM dbo.MissionsAssignedToUser 
		WHERE MissionId = @MissionId
		
		SELECT 
			@PointsAmount = Reward
			,@ExpirienceAmount = Reward
			,@EasyMission = CASE WHEN mc.Description = 'Low' THEN 1 ELSE 0 END
			,@MediumMission = CASE WHEN mc.Description = 'Medium' THEN 1 ELSE 0 END
			,@HighMission = CASE WHEN mc.Description = 'High' THEN 1 ELSE 0 END
		
		FROM dbo.MissionComplexity mc
		JOIN dbo.Missions ON
			Missions.ComplexityId = mc.ComplexityId
			AND Missions.MissionId = @MissionId
			
		
		 
		/* Update statistics*/  
		EXEC dbo.USP_STATISTICS_UPDATE 
		  @UserId = @UserKey
		  ,@CompletedMissions = 1
		  ,@Points = @PointsAmount
		  ,@Expirience = @ExpirienceAmount
		  ,@EasyMissionsCompleted = @EasyMission
		  ,@MediumMissionsCompleted = @MediumMission
		  ,@HighMissionCompleted = @HighMission
    END
END
GO


