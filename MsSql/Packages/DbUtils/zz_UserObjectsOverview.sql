/*
EXEC Zzz_Deploy 'DbUtils/Zz_UserObjectsDetails.sql'
*/
-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-25
-- Description:	Select all objects (Table,View,Procedure,ScalarFunction,TableValuedFunction) types and counts
-- =============================================
CREATE OR ALTER VIEW [dbo].[Zz_UserObjectsOverview]
AS

SELECT [ObjectType],COUNT(*) ObjectsCount
  FROM [zz_UserObjectsDetails]
  GROUP BY [ObjectType]
