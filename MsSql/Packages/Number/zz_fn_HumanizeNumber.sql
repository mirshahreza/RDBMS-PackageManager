-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-27
-- Description:	Turns numbers to human readable format
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[zz_fn_HumanizeNumber] 
( 
	@InputNumber DECIMAL(38,7), 
	@DigitsAfterPoint INT = 2 
) 
RETURNS VARCHAR(256) 
WITH SCHEMABINDING 
AS 
BEGIN 

	RETURN 'ssssssss';

END 
