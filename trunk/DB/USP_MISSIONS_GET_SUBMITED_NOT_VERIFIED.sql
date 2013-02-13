

/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_SUBMITED_NOT_VERIFIED]    Script Date: 02/13/2013 15:43:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_SUBMITED_NOT_VERIFIED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_SUBMITED_NOT_VERIFIED]
GO


CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_SUBMITED_NOT_VERIFIED]
	
AS
BEGIN
		SELECT m.MissionId
		,m.Name
		,m.Description
		,owners.UserName as ownerLogin
		,owners.FullName as Owner
		,users.FullName as CompletedBy
		,m.StartDate
		,m.EndDate
		 
		FROM dbo.Missions m
		JOIN dbo.MissionStatus ms ON
			ms.StatusId = m.StatusId
			AND ms.Description = 'Completed'
		JOIN dbo.Users owners ON
			owners.UserId = m.OwnerId
			
		JOIN dbo.MissionsAssignedToUser mu ON
			mu.MissionId = m.MissionId
		JOIN dbo.Users users ON
			users.UserId = mu.UserId
END
GO


