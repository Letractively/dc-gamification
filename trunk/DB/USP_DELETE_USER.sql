
/****** Object:  StoredProcedure [dbo].[USP_DELETE_USER]    Script Date: 02/13/2013 15:29:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DELETE_USER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DELETE_USER]
GO

CREATE PROCEDURE [dbo].[USP_DELETE_USER]
	@UserGuid uniqueidentifier
AS
BEGIN
	DELETE FROM dbo.UsersInRoles
	WHERE UserId = @UserGuid
	
	DELETE  FROM dbo.Users
	WHERE UserId = @UserGuid
END

GO


