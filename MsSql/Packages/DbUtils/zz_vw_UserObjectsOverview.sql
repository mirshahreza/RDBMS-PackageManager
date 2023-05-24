/*
EXEC zzz_sp_Deploy 'DbUtils/zz_vw_UserObjectsDetails.sql'
*/
-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-25
-- Description:	Select all objects (Table,View,Procedure,ScalarFunction,TableValuedFunction) types and counts
-- =============================================
CREATE OR ALTER VIEW [dbo].[zz_vw_UserObjectsOverview]
AS

SELECT [ObjectType],COUNT(*) ObjectsCount
  FROM [zz_vw_UserObjectsDetails]
  GROUP BY [ObjectType]
