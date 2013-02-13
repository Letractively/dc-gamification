
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_OWNER_LOGIN]    Script Date: 02/13/2013 15:41:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_OWNER_LOGIN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_OWNER_LOGIN]
GO


CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_OWNER_LOGIN]
	@MissionId int
AS
BEGIN
	SELECT
		u.UserName as Owner
		
		 
	FROM dbo.Missions m
	JOIN dbo.Users u ON
		u.UserId = m.OwnerId
		AND m.MissionId = @MissionId
	
	
END
GO


