
/****** Object:  StoredProcedure [dbo].[USP_REWARDS_GET_NOTIFICATIONS]    Script Date: 02/13/2013 15:43:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_REWARDS_GET_NOTIFICATIONS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_REWARDS_GET_NOTIFICATIONS]
GO


CREATE PROCEDURE [dbo].[USP_REWARDS_GET_NOTIFICATIONS]
	@UserKey uniqueidentifier
AS
BEGIN

DECLARE @Ids TABLE(id int)
	INSERT INTO @Ids(id)
	SELECT Id
	FROM dbo.UsersGrantedReward
	WHERE 
		UserId = @UserKey
		AND UserIsNotifiedByMessage = 0
		
	UPDATE dbo.UsersGrantedReward
	SET UserIsNotifiedByMessage = 1
	WHERE 
		UserId = @UserKey
		AND UserIsNotifiedByMessage = 0
		
	/* Return Values*/
	SELECT top 1
		ugr.Id
		,ugr.UserId
		,grd.Name as RuleName
		,grd.Description
		,bc.Name as BadgeName
		,bc.[Message] as RewardMessage
		,bc.ImageFileKey
		
	FROM dbo.UsersGrantedReward ugr
	JOIN @Ids ids ON
		ids.id = ugr.Id
	JOIN dbo.GrantRulesDictionaty grd ON
		grd.GrantRuleId = ugr.GrantRuleId
	JOIN dbo.BadgesCollection bc ON
		bc.GrantRuleId = grd.GrantRuleId
END
GO


