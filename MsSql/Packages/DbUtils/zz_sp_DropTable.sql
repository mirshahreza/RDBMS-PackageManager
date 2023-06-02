-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-06-02
-- Description:	Drop a table from a database
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[zz_sp_DropTable]
	@TableName VARCHAR(128)
AS

BEGIN

	DECLARE @S NVARCHAR(4000);
	SET @S = 'DROP TABLE ' + @TableName;
	EXECUTE SP_EXECUTESQL @S;

END