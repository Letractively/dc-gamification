

/****** Object:  StoredProcedure [dbo].[USP_STAGE_LEADER_GET]    Script Date: 02/13/2013 15:45:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_STAGE_LEADER_GET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_STAGE_LEADER_GET]
GO

CREATE PROCEDURE [dbo].[USP_STAGE_LEADER_GET]
	@LeaderType nvarchar(30)
AS
BEGIN
	DECLARE 
		@CurrentStageId int
		,@SpecializationId int
		
	SELECT TOP 1 @CurrentStageId = StageId
	FROM dbo.Stages s 
	WHERE GETDATE() BETWEEN s.Start_Date AND s.End_Date 
	
	SELECT @SpecializationId = SpecializationId
	FROM dbo.UserSpecialization
	WHERE Description = @LeaderType 
	
	
	
	SELECT TOP 1 
		
		u.FullName
		,u.Image_key
		,us.*
	FROM dbo.UsersStageStatistics us
	JOIN dbo.Users u ON
	 u.UserId = us.UserId
	 AND u.SpecializationId = @SpecializationId
	WHERE 
		us.StageId = @CurrentStageId
		
	ORDER BY us.Experience DESC
END
GO


