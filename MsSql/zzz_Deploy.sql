-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2023-05-11
-- Description:	To fetch and deploy scripts from a repository
-- =============================================
SP_CONFIGURE 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
SP_CONFIGURE 'Ole Automation Procedures', 1;  
GO  
RECONFIGURE;  
GO  

CREATE OR ALTER   PROCEDURE [dbo].[Zzz_Deploy] @PackageName VARCHAR(512)
AS
BEGIN

	DECLARE	@rr INT,@rv NVARCHAR(4000);
	DECLARE @BaseURL NVARCHAR(4000) = N'https://raw.githubusercontent.com/mirshahreza/RDBMS-PackageManager/master/MsSql/Packages/';
	DECLARE @PackageFullURL NVARCHAR(4000) = @BaseURL + @PackageName;

	IF(@PackageFullURL NOT LIKE N'%.sql') SET @PackageFullURL = @PackageFullURL + '/All.sql'

	DECLARE @status INT;
	DECLARE @responseText AS TABLE(responseText NVARCHAR(MAX));
	DECLARE @res AS INT;
	EXEC SP_OACREATE 'MSXML2.ServerXMLHTTP', @res OUT;
	EXEC SP_OAMETHOD @res, 'open', NULL, 'GET',@PackageFullURL,'false';
	EXEC SP_OAMETHOD @res, 'send';
	EXEC SP_OAGETPROPERTY @res, 'status', @status OUT;
	INSERT INTO @ResponseText (ResponseText) EXEC SP_OAGETPROPERTY @res, 'responseText';
	EXEC SP_OADESTROY @res;
	SELECT @rr=@status,@rv=responseText FROM @responseText;

	IF(@rr=200)
	BEGIN
		PRINT @PackageName + ' fetched successful.'
		SET @rv = LTRIM(RTRIM(@rv));
		IF(CHARINDEX('/*', @rv)=1)
		BEGIN
			DECLARE @deps NVARCHAR(4000);
			SET @deps = LTRIM(RTRIM(SUBSTRING(@rv, 3, CHARINDEX('*/', @rv)-3)));
			EXECUTE SP_EXECUTESQL @deps;
		END

		EXECUTE SP_EXECUTESQL @rv;
		PRINT @PackageName + ' executed successful.';
	END
	ELSE
	BEGIN
		PRINT @PackageName + ' fetch problem.'
		PRINT 'Status Code : ' + CAST(@rr AS NVARCHAR);
		PRINT 'Problem details : ' + @rv;
	END

END
