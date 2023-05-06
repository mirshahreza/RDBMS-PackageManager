# zz_Sample
A sample to show
1- How to implement packages - naming and folder structure
2- How to deploy Package or individual scripts

 
### Deploy all scripts
>EXEC dbo.zzz_sp_Deploy 'zz_Sample'
--OR 
>EXEC dbo.zzz_sp_Deploy 'zz_Sample/All.sql'

### Deploy individual scripts
>EXEC dbo.zzz_sp_Deploy 'zz_Sample/zz_sp_Individual.sql'
