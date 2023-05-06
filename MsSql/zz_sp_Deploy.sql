sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
sp_configure 'Ole Automation Procedures', 1;  
GO  
RECONFIGURE;  
GO  

CREATE OR ALTER PROCEDURE [dbo].[zz_sp_Deploy] @PackageName VARCHAR(512)
AS
BEGIN

	DECLARE @BaseURL NVARCHAR(4000) = N'https://github.com/mirshahreza/RDBMS-PackageManager/MsSql/Packages/raw/';
	DECLARE @PackageFullURL NVARCHAR(4000) = @BaseURL + @PackageName;
	DECLARE	@rr INT;
	DECLARE @rv NVARCHAR(4000);

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
		DECLARE @sql NVARCHAR(4000);
		SET @rv = LTRIM(RTRIM(@rv));
		IF(CHARINDEX('/*', @rv)=1)
		BEGIN
			SET @sql = LTRIM(RTRIM(SUBSTRING(@rv, 3, CHARINDEX('*/', @rv)-3)));
		END
		ELSE
		BEGIN
			SET @sql = @rv;
		END

		EXECUTE SP_EXECUTESQL @sql;
		PRINT @PackageName + ' executed successful.';
		PRINT '---------------------------------------------------';
		PRINT @rv;
		PRINT '---------------------------------------------------';
	END
	ELSE
	BEGIN
		PRINT @PackageName + ' fetch problem.'
		PRINT 'Status Code : ' + CAST(@rr AS NVARCHAR);
		PRINT 'Problem details : ' + @rv;
	END

END
