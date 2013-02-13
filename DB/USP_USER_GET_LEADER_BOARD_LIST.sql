
/****** Object:  StoredProcedure [dbo].[USP_USER_GET_LEADER_BOARD_LIST]    Script Date: 02/13/2013 15:46:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_USER_GET_LEADER_BOARD_LIST]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_USER_GET_LEADER_BOARD_LIST]
GO



CREATE PROCEDURE [dbo].[USP_USER_GET_LEADER_BOARD_LIST]
	@Mode bit = 0,/* 0 - all; 1-one */
	@RuleNumber int = 1 
	/*
		rule definitions
		exec USP_USER_GET_LEADER_BOARD_LIST @Mode = 0, @RuleNumber = 1
	*/
AS
BEGIN
	
		SELECT 
		ROW_NUMBER() OVER(ORDER BY us.Experience DESC) AS Position
		,u.UserId
		,u.UserName
		,u.FullName
		,u.Image_key
		,u.RegisterDate 
		,us.CreatedMissions
		,us.CompletedMissions
		,us.FailedMissions
		,us.UnlockedBadges
		,us.UnlockedUniqueBadges
		,DATEDIFF(DAY, u.RegisterDate, GETDATE()) as DaysOnBoard
		,us.Experience
		,us.Points
		,usp.Description as SpecializationDescription
		,(select top 1 Description from dbo.Ranks where ExpRequired <= us.Experience order by ExpRequired desc) as RankDescr
		,(select top 1 ImageName from dbo.Ranks where ExpRequired <= us.Experience order by ExpRequired desc)  as RankImageName
		
		FROM dbo.Users u
		JOIN dbo.UsersStatistics us ON
			us.UserId = u.UserId
		JOIN dbo.UserSpecialization usp ON 
			usp.SpecializationId = u.SpecializationId
			
		
		
	
END
GO


