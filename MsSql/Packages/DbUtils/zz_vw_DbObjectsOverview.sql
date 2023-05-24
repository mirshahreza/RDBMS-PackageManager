-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-25
-- Description:	Select all objects (Table,View,Procedure,ScalarFunction,TableValuedFunction) types and counts
-- =============================================
CREATE OR ALTER VIEW [dbo].[zz_vw_DbObjectsOverview]
AS

SELECT [ObjectType],COUNT(*) ObjectsCount
  FROM [zz_vw_UserObjects]
  GROUP BY [ObjectType]
  ORDER BY COUNT(*) DESC
