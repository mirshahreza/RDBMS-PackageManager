/*
EXEC zzz_sp_Deploy 'Sample/zz_fn_Add.sql'
*/
CREATE OR ALTER PROCEDURE [dbo].[zz_sp_Add] @A INT,@B INT
AS
BEGIN
	SELECT dbo.zz_fn_Add (@A,@B);
END
