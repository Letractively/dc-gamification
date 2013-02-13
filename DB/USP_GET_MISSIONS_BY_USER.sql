/****** Object:  StoredProcedure [dbo].[USP_GET_MISSIONS_BY_USER]    Script Date: 02/13/2013 15:29:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GET_MISSIONS_BY_USER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GET_MISSIONS_BY_USER]
GO
CREATE PROCEDURE [dbo].[USP_GET_MISSIONS_BY_USER]
	@UserKey uniqueidentifier
AS
BEGIN
	SELECT 
	m.MissionId
	,m.Name
	,m.Description
	,mc.Reward
	,m.PlayerType
	,m.Owner
	,m.StartDate
	,m.EndDate
	,m.SkillsRequired
	,m.StatusId
	,ms.Description as StatusDescription
	,m.TypeId
	,mt.Description as TypeDescription
	,m.ComplexityId
	,mc.Description as ComplexityDescription
FROM dbo.Missions m
	JOIN dbo.MissionStatus ms ON
		m.StatusId = ms.StatusId
	JOIN dbo.MissionType mt ON
		m.TypeId = mt.TypeId
	JOIN dbo.MissionComplexity mc ON
		mc.ComplexityId = m.ComplexityId
WHERE