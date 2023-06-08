-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-27
-- Description:	Select all tables with all indexes
-- =============================================
CREATE OR ALTER VIEW [dbo].[Zz_UserTablesIndexes]
AS

SELECT zz_UserObjectsDetails.ObjectId ObjectId, zz_UserObjectsDetails.ObjectName TableName, IndexesT.IndexName,IndexType,IsUnique
FROM zz_UserObjectsDetails
LEFT OUTER JOIN (
	SELECT OBJECT_ID ObjectId,NAME AS IndexName,TYPE_DESC  AS IndexType,IS_UNIQUE IsUnique
	FROM SYS.INDEXES
	WHERE IS_HYPOTHETICAL = 0 AND INDEX_ID != 0 
	) IndexesT ON IndexesT.ObjectId=zz_UserObjectsDetails.ObjectId
WHERE zz_UserObjectsDetails.ObjectType='Table'



