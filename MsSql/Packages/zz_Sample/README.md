# zz_Sample
A sample to show
- How to implement packages - naming and folder structure
- How to deploy Package or individual scripts

 
### Deploy all scripts
>EXEC dbo.zzz_sp_Deploy 'zz_Sample'
--OR 
>EXEC dbo.zzz_sp_Deploy 'zz_Sample/All.sql'

### Deploy individual scripts
>EXEC dbo.zzz_sp_Deploy 'zz_Sample/zz_sp_Individual.sql'
