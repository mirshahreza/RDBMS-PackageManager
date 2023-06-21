-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-06-21
-- Description:	Creates a new procedure
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Zz_CreateEmptyProcedure]
	@ProcedureName VARCHAR(128)
AS

BEGIN

	DECLARE @S NVARCHAR(4000);
	SET @S = '
CREATE PROCEDURE [DBO].['+@ProcedureName+'] 
	@Param1 INT
AS
BEGIN
	SELECT Param1;
END
';

	EXECUTE SP_EXECUTESQL @S;
END