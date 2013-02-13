
/****** Object:  StoredProcedure [dbo].[USP_BADGES_GET_UNLOCKED_IMAGE_PATH]    Script Date: 02/13/2013 15:28:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_BADGES_GET_UNLOCKED_IMAGE_PATH]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_BADGES_GET_UNLOCKED_IMAGE_PATH]
GO
CREATE PROCEDURE [dbo].[USP_BADGES_GET_UNLOCKED_IMAGE_PATH]
	@UserKey uniqueidentifier
	,@GroupId int
AS
BEGIN
	
	SELECT 
	Convert(VARCHAR(50) ,bc.ImageFileKey) + '.png'
	
	FROM dbo.BadgesCollection bc
	JOIN dbo.BadgesAssignedToUser bu ON
		bu.FileGroupId = bc.FileGroupId
		AND bu.UserId = @UserKey
	WHERE bc.FileGroupId = @GroupId
	
END
GO


