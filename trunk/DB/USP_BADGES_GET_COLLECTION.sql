
/****** Object:  StoredProcedure [dbo].[USP_BADGES_GET_COLLECTION]    Script Date: 02/13/2013 15:28:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_BADGES_GET_COLLECTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_BADGES_GET_COLLECTION]
GO
CREATE PROCEDURE [dbo].[USP_BADGES_GET_COLLECTION]
	
AS
BEGIN
	SELECT b.FileGroupId
	,b.Name
	,b.Message
	,b.Description
	,b.ImageFileKey
	,b.LockedFileKey
      ,'~\Images\Badges\'+Convert(VARCHAR(50),b.ImageFileKey) + '.png' as ImageURL
      ,'~\Images\Badges\'+Convert(VARCHAR(50),b.LockedFileKey) + '.png' as LockedURL
      ,ImageType
      ,r.Name as GrantRuleName
  FROM [dbo].[BadgesCollection] b
  LEFT JOIN dbo.GrantRulesDictionaty r ON
	r.GrantRuleId = b.GrantRuleId
END
GO


