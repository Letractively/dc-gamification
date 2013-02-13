/****** Object:  StoredProcedure [dbo].[USP_BADGES_GET_BY_USER_AND_TYPE]    Script Date: 02/13/2013 15:28:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_BADGES_GET_BY_USER_AND_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_BADGES_GET_BY_USER_AND_TYPE]
GO

CREATE PROCEDURE [dbo].[USP_BADGES_GET_BY_USER_AND_TYPE]
	@UserKey uniqueidentifier
	,@ImageType varchar(50)
AS
BEGIN
	SELECT
		-1 as FileGroupId
	,null as ImageUrl
	,'Empty' as Name

	,0 as IsLocked
	,@ImageType
	
	UNION
	SELECT 
	bc.FileGroupId
	,CASE
		WHEN bu.UserId IS NOT NULL 
		THEN '~\Images\Badges\' + Convert(VARCHAR(50) ,bc.ImageFileKey) + '.png'
		
		ELSE '~\Images\Badges\' + Convert(VARCHAR(50) ,bc.LockedFileKey) + '.png'
	END as ImageUrl
	,bc.Name 

	,CASE
		WHEN bu.UserId IS NOT NULL 
		THEN 0
		ELSE 1
	END as IsLocked
	,bc.ImageType
	FROM dbo.BadgesCollection bc
	LEFT JOIN dbo.BadgesAssignedToUser bu ON
		bu.FileGroupId = bc.FileGroupId
		AND bu.UserId = @UserKey
	WHERE bc.ImageType = @ImageType
	
END
GO


