
/****** Object:  StoredProcedure [dbo].[USP_USERS_REGISTER_NEW]    Script Date: 02/13/2013 15:48:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_USERS_REGISTER_NEW]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_USERS_REGISTER_NEW]
GO


CREATE PROCEDURE [dbo].[USP_USERS_REGISTER_NEW]
	@UserName nvarchar(50),
	@UserFullName nvarchar(50)
AS
BEGIN
	DECLARE 
		@DefaultRole uniqueidentifier
		,@AplicationId uniqueidentifier
		,@UserId uniqueidentifier
		
	SELECT @UserId	= NEWID()
		
	SELECT @DefaultRole = RoleId 
	FROM dbo.Roles
	WHERE RoleName = 'User'
	
	SELECT @AplicationId = ApplicationId 
	FROM dbo.Applications
	WHERE ApplicationName = 'DC Gamification Portal'
	
	
	INSERT INTO dbo.Users(UserId, ApplicationId, UserName, FullName, IsAnonymous, LastActivityDate, RegisterDate)
	VALUES (@UserId, @AplicationId, @UserName, @UserFullName, 0, GETDATE(),GETDATE())
	
	INSERT INTO dbo.UsersInRoles(UserId, RoleId)
	VALUES(@UserId, @DefaultRole)
	
	INSERT INTO dbo.UsersStatistics (UserId)
	VALUES(@UserId)
	
	INSERT INTO dbo.UsersStageStatistics(StageId, UserId )
	SELECT TOP 1 StageId, @UserId
	FROM dbo.Stages
	WHERE IsCurrent = 1
	
	SELECT @UserId
END
GO


