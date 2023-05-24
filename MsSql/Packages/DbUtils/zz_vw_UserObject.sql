-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-25
-- Description:	Select all object (Table,View,Procedure,ScalarFunction,TableValuedFunction) created by user
-- =============================================
CREATE OR ALTER VIEW [dbo].[zz_vw_UserObjects]
AS

SELECT NAME AS ObjectName ,'Table'					ObjectType,	CREATE_DATE CreatedOn, MODIFY_DATE UpdatedOn, 1 ViewOrder FROM SYS.OBJECTS WHERE TYPE_DESC='USER_TABLE'
UNION ALL 																			   
SELECT NAME AS ObjectName ,'View'					ObjectType,	CREATE_DATE CreatedOn, MODIFY_DATE UpdatedOn, 2 ViewOrder FROM SYS.OBJECTS WHERE TYPE_DESC='VIEW'
UNION ALL 																			   
SELECT NAME AS ObjectName ,'Procedure'				ObjectType,	CREATE_DATE CreatedOn, MODIFY_DATE UpdatedOn, 3 ViewOrder FROM SYS.OBJECTS WHERE TYPE_DESC='SQL_STORED_PROCEDURE'
UNION ALL 																			   
SELECT NAME AS ObjectName ,'ScalarFunction'			ObjectType,	CREATE_DATE CreatedOn, MODIFY_DATE UpdatedOn, 4 ViewOrder FROM SYS.OBJECTS WHERE TYPE_DESC='SQL_SCALAR_FUNCTION'
UNION ALL 																			   
SELECT NAME AS ObjectName ,'TableValuedFunction'	ObjectType,	CREATE_DATE CreatedOn, MODIFY_DATE UpdatedOn, 4 ViewOrder FROM SYS.OBJECTS WHERE TYPE_DESC='SQL_TABLE_VALUED_FUNCTION'

