-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-06-02
-- Description:	Drop a Procedure from a database
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Zz_DropProcedure]
	@Procedure VARCHAR(128)
AS

BEGIN

	DECLARE @S NVARCHAR(4000);
	SET @S = 'DROP PROCEDURE IF EXISTS ' + @Procedure;
	EXECUTE SP_EXECUTESQL @S;

END
