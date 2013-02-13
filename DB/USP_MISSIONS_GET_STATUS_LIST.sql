
/****** Object:  StoredProcedure [dbo].[USP_MISSIONS_GET_STATUS_LIST]    Script Date: 02/13/2013 15:42:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MISSIONS_GET_STATUS_LIST]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MISSIONS_GET_STATUS_LIST]
GO


CREATE PROCEDURE [dbo].[USP_MISSIONS_GET_STATUS_LIST]
	@StatusId int
AS
BEGIN
	
	DECLARE @StatusDescr nvarchar(50)
	SELECT @StatusDescr = Description 
	FROM [MissionStatus]
	WHERE StatusId = @StatusId
	
	IF (@StatusDescr = 'Pending')
	BEGIN
		SELECT StatusId, Description
		FROM [MissionStatus]
		WHERE Description in ('Pending', 'Active')
	END
	IF (@StatusDescr = 'Active')
	BEGIN
		SELECT StatusId, Description
		FROM [MissionStatus]
		WHERE Description in ('Canceled', 'Active')
	END
	ELSE
	IF (@StatusDescr = 'In Progress')
	BEGIN
		SELECT StatusId, Description
		FROM [MissionStatus]
		WHERE Description in ('In Progress', 'Canceled', 'Failed', 'Submited')
	END
	ELSE
	IF (@StatusDescr = 'Submited')
	BEGIN
		SELECT StatusId, Description
		FROM [MissionStatus]
		WHERE Description in ('Submited', 'Completed', 'Failed')
	END
	ELSE 
	IF (@StatusDescr = 'Completed')
	BEGIN
		SELECT StatusId, Description
		FROM [MissionStatus]
		WHERE Description in ('Completed', 'Closed')
	END
	ELSE 
	BEGIN
	SELECT StatusId, Description
		FROM [MissionStatus]
	END
	
END
GO


