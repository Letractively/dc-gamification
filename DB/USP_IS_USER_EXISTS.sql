
/****** Object:  StoredProcedure [dbo].[USP_IS_USER_EXISTS]    Script Date: 02/13/2013 15:37:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IS_USER_EXISTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IS_USER_EXISTS]
GO


CREATE PROCEDURE [dbo].[USP_IS_USER_EXISTS]
	@UserName nvarchar(50)
AS
BEGIN
	IF (EXISTS (SELECT * FROM dbo.Users WHERE UserName = @UserName))
		SELECT 1
    ELSE
		SELECT 0
END

GO


