
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_COUNT_BY_STATUS]    Script Date: 02/13/2013 15:40:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_COUNT_BY_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_COUNT_BY_STATUS]
GO

CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_COUNT_BY_STATUS]
	@StatusDescr nvarchar(50)
AS
BEGIN
	SELECT COUNT(*) as missions_count
FROM dbo.Missions m
	JOIN dbo.MissionStatus ms ON
		m.StatusId = ms.StatusId
		AND ms.Description = @StatusDescr
END
GO


