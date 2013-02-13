
/****** Object:  StoredProcedure [dbo].[USP_MISSION_SUBMIT_BY_USER]    Script Date: 02/13/2013 15:38:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSION_SUBMIT_BY_USER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSION_SUBMIT_BY_USER]
GO


CREATE PROCEDURE [dbo].[USP_MISSION_SUBMIT_BY_USER]
@MissionId int,
	@UserKey uniqueidentifier
AS
BEGIN
	DECLARE 
		@StatusSubmitedId int
	
	Select @StatusSubmitedId = StatusId
	FROM
	dbo.MissionStatus
	WHERE Description = 'Submited'
	
	UPDATE dbo.Missions
	SET StatusId = @StatusSubmitedId
	WHERE MissionId = @MissionId
END
GO


