
/****** Object:  StoredProcedure [dbo].[USP_GRANT_REVARDS]    Script Date: 02/13/2013 15:36:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GRANT_REVARDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GRANT_REVARDS]
GO


CREATE PROCEDURE [dbo].[USP_GRANT_REVARDS]
	@UserKey uniqueidentifier 
AS
BEGIN
	DECLARE 
		@RuleId int
		,@rule nvarchar(MAX)
		,@rule_to_execute nvarchar(max)
		,@result bit
		
	DECLARE 
		@UniqueCount int
		,@StandartCount int		
		
	DECLARE grant_rules_cursor CURSOR FOR
	SELECT r.GrantRuleId, r.RuleStatement
	FROM dbo.GrantRulesDictionaty r
	WHERE r.GrantRuleId NOT IN (SELECT GrantRuleId FROM dbo.UsersGrantedReward WHERE UserId = @UserKey)

	OPEN grant_rules_cursor   
	FETCH NEXT FROM grant_rules_cursor INTO @RuleId, @rule

	WHILE @@FETCH_STATUS = 0   
	BEGIN   
	
		    set @result = 0
		    set @rule_to_execute = REPLACE(@rule, '@UserId', '''' + CONVERT(varchar(36), @UserKey) + '''')
		    exec sp_executesql @rule_to_execute, N'@result bit output', @result output
			select @result, @RuleId, @rule_to_execute
			IF (@result = 1)
			BEGIN
			 /* grant reward */
				
				
				INSERT INTO dbo.BadgesAssignedToUser(UserId, FileGroupId)
				SELECT  @UserKey, FileGroupId
				FROM dbo.BadgesCollection
				WHERE 
					GrantRuleId = @RuleId
					AND ImageType <> 'Unique'
				SELECT @StandartCount = @@ROWCOUNT
				
				INSERT INTO dbo.BadgesAssignedToUser(UserId, FileGroupId)
				SELECT  @UserKey, FileGroupId
				FROM dbo.BadgesCollection
				WHERE 
					GrantRuleId = @RuleId
					AND ImageType = 'Unique'
				SELECT @UniqueCount = @@ROWCOUNT
					
				INSERT INTO dbo.UsersGrantedReward (GrantRuleId, UserId)
				VALUES (@RuleId, @UserKey)
				exec [USP_STATISTICS_UPDATE] 
					@UserId = @UserKey
					,@CHECK_REWARDS = 0
					,@UnlockedBadges  = @StandartCount
					,@UnlockedUniqueBadges  = @UniqueCount
			END
		    
		    FETCH NEXT FROM grant_rules_cursor INTO @RuleId, @rule
	END   

	CLOSE grant_rules_cursor   
	DEALLOCATE grant_rules_cursor


END
GO


