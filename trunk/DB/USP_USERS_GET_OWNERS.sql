
/****** Object:  StoredProcedure [dbo].[USP_USERS_GET_OWNERS]    Script Date: 02/13/2013 15:47:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_USERS_GET_OWNERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_USERS_GET_OWNERS]
GO



CREATE PROCEDURE [dbo].[USP_USERS_GET_OWNERS]
	
AS
BEGIN
	SELECT DISTINCT u.UserId, u.FullName 
	FROM dbo.Users u
	JOIN dbo.UsersInRoles ur ON
		ur.UserId = u.UserId
	JOIN dbo.Roles r ON
		r.RoleId = ur.RoleId
		AND r.RoleName in ('SystemAdmin', 'Admin', 'MissionCreator', 'Moderator')
END

GO


