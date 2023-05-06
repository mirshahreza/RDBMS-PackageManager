/*
EXEC zz_sp_Deploy 'zz_Sample/zz_fn_Add.sql'
*/
CREATE OR ALTER PROCEDURE [dbo].[zz_Sample] @A INT,@B INT
AS
BEGIN
	SELECT dbo.zz_fn_Add (@A,@B);
END
