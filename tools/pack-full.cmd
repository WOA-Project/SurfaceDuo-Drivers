@echo off

mkdir ..\..\SurfaceDuo-Drivers-Release
del ..\..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Full.zip

mkdir SurfaceDuo-Drivers-Full
mkdir SurfaceDuo-Drivers-Full\components
mkdir SurfaceDuo-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC SurfaceDuo-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC8150 SurfaceDuo-Drivers-Full\components\QC8150
xcopy /cheriky ..\components\QC8350 SurfaceDuo-Drivers-Full\components\QC8350
xcopy /cheriky ..\components\QC8550 SurfaceDuo-Drivers-Full\components\QC8550
xcopy /cheriky ..\definitions\Desktop SurfaceDuo-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -t7z -r ..\..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Full.7z SurfaceDuo-Drivers-Full\*

rmdir /Q /S SurfaceDuo-Drivers-Full