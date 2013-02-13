
/****** Object:  StoredProcedure [dbo].[USP_USER_GET_PROFILE]    Script Date: 02/13/2013 15:47:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_USER_GET_PROFILE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_USER_GET_PROFILE]
GO



CREATE PROCEDURE [dbo].[USP_USER_GET_PROFILE]
	@UserKey uniqueidentifier
AS
BEGIN
	SELECT
	u.UserId
	,u.UserName
	,u.FullName
	,u.Image_key
	,us.Experience
	,(select top 1 ExpRequired from dbo.Ranks where ExpRequired <= us.Experience order by ExpRequired desc)as PrevLevelExp
	,(select top 1 ExpRequired from dbo.Ranks where ExpRequired > us.Experience order by ExpRequired)as NextLevelExp
	
	,(select top 1 Description from dbo.Ranks where ExpRequired <= us.Experience order by ExpRequired desc) as RankDescription
	,us.CompletedMissions as CompletedMissionsCount
	,us.FailedMissions as FailedMissionsCount
	,ISNULL(usp.Description, 'Not Available') as UserSpecialization
	FROM dbo.Users u
	JOIN dbo.UsersStatistics us ON
		us.UserId = u.UserId
	
		
	LEFT JOIN dbo.UserSpecialization usp ON
		usp.SpecializationId = u.SpecializationId
			
	WHERE u.UserId = @UserKey
END
GO


