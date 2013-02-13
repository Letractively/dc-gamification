
/****** Object:  StoredProcedure [dbo].[USP_MISSION_CREATE]    Script Date: 02/13/2013 15:37:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSION_CREATE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSION_CREATE]
GO


CREATE PROCEDURE [dbo].[USP_MISSION_CREATE]
	
@Name nvarchar(250)
,@Description nvarchar(max)
,@Skills nvarchar(250)
,@Type int
,@Complexity int
,@StartDate date
,@EndDate date
,@PlayerType nvarchar(10)
,@Owner uniqueidentifier
,@UserKey uniqueidentifier

AS
BEGIN
DECLARE @StatusId int
		SELECT @StatusId = StatusId
		FROM dbo.MissionStatus WHERE Description = 'Pending'

	INSERT INTO [dbo].[Missions]
           ([Name]
           ,[Description]
           ,SkillsRequired
           ,[TypeId]
           ,[ComplexityId]
           ,[StartDate]
           ,[EndDate]
           ,[PlayerType]
           ,[OwnerId]
           ,[StatusId]
           ,[CreatorKey]
           ,StageId
           )
     VALUES
           (@Name
           ,@Description
           ,@Skills
           ,@Type
           ,@Complexity
           ,@StartDate
           ,@EndDate
           ,@PlayerType
           ,@Owner
           ,@StatusId
           ,@UserKey
           ,null
           )
           
      /* Update statistics*/  
      EXEC dbo.USP_STATISTICS_UPDATE 
      @UserId = @Owner
      ,@CreatedMissions = 1
END
GO


