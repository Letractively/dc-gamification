
/****** Object:  StoredProcedure [dbo].[USP_ADD_USER_WITH_DEFAULT_ROLE]    Script Date: 02/13/2013 15:28:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ADD_USER_WITH_DEFAULT_ROLE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ADD_USER_WITH_DEFAULT_ROLE]
GO

CREATE PROCEDURE [dbo].[USP_ADD_USER_WITH_DEFAULT_ROLE] 
	@UserName nvarchar(50)
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
	
	INSERT INTO dbo.Users(UserId, ApplicationId, UserName, IsAnonymous, LastActivityDate)
	VALUES (@UserId, @AplicationId, @UserName, 0, GETDATE())
	
	INSERT INTO dbo.UsersInRoles(UserId, RoleId)
	VALUES(@UserId, @DefaultRole)
END

GO


