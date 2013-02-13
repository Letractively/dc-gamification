
/****** Object:  StoredProcedure [dbo].[USP_USERS_GET_WITH_ROLES]    Script Date: 02/13/2013 15:47:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_USERS_GET_WITH_ROLES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_USERS_GET_WITH_ROLES]
GO


CREATE PROCEDURE [dbo].[USP_USERS_GET_WITH_ROLES]
AS
BEGIN
	SELECT 
		u.UserId 
		,u.UserName
		,dbo.fn_RoleAssigned(UserId, 'SystemAdmin') as SystemAdmin
		,dbo.fn_RoleAssigned(UserId, 'Admin') as [Admin]
		,dbo.fn_RoleAssigned(UserId, 'Moderator') as Moderator
		,dbo.fn_RoleAssigned(UserId, 'MissionsCreator') as MissionsCreator
		,dbo.fn_RoleAssigned(UserId, 'User') as [User]
		,u.SpecializationId
		,ISNULL(us.Description, 'Not Defined') as SpecializationDescription
	FROM dbo.Users u 
	LEFT JOIN dbo.UserSpecialization us ON
		us.SpecializationId = u.SpecializationId
END

GO


