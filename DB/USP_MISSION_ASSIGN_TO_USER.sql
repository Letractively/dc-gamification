

/****** Object:  StoredProcedure [dbo].[USP_MISSION_ASSIGN_TO_USER]    Script Date: 02/13/2013 15:37:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSION_ASSIGN_TO_USER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSION_ASSIGN_TO_USER]
GO

CREATE PROCEDURE [dbo].[USP_MISSION_ASSIGN_TO_USER]
	@MissionId int,
	@UserId uniqueidentifier
AS
BEGIN

	INSERT INTO dbo.MissionsAssignedToUser(MissionId, UserId)
	VALUES(@MissionId, @UserId)
	
	DECLARE @InProgressId int
	SELECT @InProgressId = StatusId
	FROM dbo.MissionStatus
	WHERE Description = 'In Progress'
	
	UPDATE dbo.Missions
	SET StatusId = @InProgressId
	WHERE MissionId = @MissionId
END
GO


