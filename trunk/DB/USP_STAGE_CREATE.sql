
/****** Object:  StoredProcedure [dbo].[USP_STAGE_CREATE]    Script Date: 02/13/2013 15:44:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_STAGE_CREATE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_STAGE_CREATE]
GO



CREATE PROCEDURE [dbo].[USP_STAGE_CREATE]
	@Description nvarchar(100)
	,@StartDate DateTime
	,@EndDate DateTime
AS
BEGIN
	DECLARE @StageId int
	
	INSERT INTO dbo.Stages(Description, Start_Date, End_Date) 
	VALUES (@Description, @StartDate, @EndDate)
	SELECT @StageId = IDENT_CURRENT('dbo.Stages')
	
	INSERT INTO dbo.UsersStageStatistics (UserId, StageId)
	SELECT UserId, @StageId
	FROM dbo.Users
END

GO


