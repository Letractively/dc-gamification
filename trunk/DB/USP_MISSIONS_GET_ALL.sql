
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_ALL]    Script Date: 02/13/2013 15:40:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_ALL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_ALL]
GO

CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_ALL]
AS
BEGIN
	SELECT 
	m.MissionId
	,m.Name
	,m.Description
	,mc.Reward
	,m.PlayerType
	,u.UserId as OwnerId
	,u.FullName as OwnerFullName
	,m.StartDate
	,m.EndDate
	,m.SkillsRequired
	,m.StatusId
	,ms.Description as StatusDescription
	,m.TypeId
	,mt.Description as TypeDescription
	,m.ComplexityId
	,mc.Description as ComplexityDescription
	,m.StageId
	,s.Description as StageDescription
FROM dbo.Missions m
	JOIN dbo.MissionStatus ms ON
		m.StatusId = ms.StatusId
	JOIN dbo.MissionType mt ON
		m.TypeId = mt.TypeId
	JOIN dbo.MissionComplexity mc ON
		mc.ComplexityId = m.ComplexityId
	JOIN dbo.Users u ON
		u.UserId = m.OwnerId	
	LEFT JOIN dbo.Stages s ON
		s.StageId = m.StageId
	
END
GO


