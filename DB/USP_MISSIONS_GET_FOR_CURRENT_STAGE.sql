
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_FOR_CURRENT_STAGE]    Script Date: 02/13/2013 15:41:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_FOR_CURRENT_STAGE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_FOR_CURRENT_STAGE]
GO

CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_FOR_CURRENT_STAGE]
AS
BEGIN
	SELECT 
	m.MissionId
	,m.Name
	,m.Description
	,mc.Reward
	,m.PlayerType
	,m.StartDate
	,m.EndDate
	,m.SkillsRequired
	,m.StatusId
	,ms.Description as StatusDescription
	,m.TypeId
	,mt.Description as TypeDescription
	,m.ComplexityId
	,mc.Description as ComplexityDescription
	,own.FullName as Owner
	,m.StageId
	,s.Description as StageDescription
FROM dbo.Missions m
	JOIN dbo.MissionStatus ms ON
		m.StatusId = ms.StatusId
	JOIN dbo.MissionType mt ON
		m.TypeId = mt.TypeId
	JOIN dbo.MissionComplexity mc ON
		mc.ComplexityId = m.ComplexityId
	JOIN dbo.Users own ON
		own.UserId = m.OwnerId	
	LEFT JOIN dbo.Stages s ON
		s.StageId = m.StageId
	LEFT JOIN dbo.MissionsAssignedToUser msigned ON
		msigned.MissionId = m.MissionId
	LEFT JOIN dbo.Users assignedto ON
		assignedto.UserId = msigned.UserId
	WHERE s.Start_Date <= GETDATE() AND s.End_Date >= GETDATE()
	AND ms.Description in ('Active', 'In Progress')
END
GO


