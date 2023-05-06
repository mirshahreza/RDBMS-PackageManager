# zz_Sample

This deployments are valid

// Deploy all scripts
EXEC dbo.zz_sp_Deploy 'zz_Sample'
OR 
EXEC dbo.zz_sp_Deploy 'zz_Sample/All.sql'

// Deploy just zz_sp_Individual.sql
EXEC dbo.zz_sp_Deploy 'zz_Sample/zz_sp_Individual.sql'



