@echo off

mkdir ..\..\SurfaceDuo-Drivers-Release
del ..\..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Desktop-Zeta.7z

echo @echo off > ..\OnlineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OnlineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OnlineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\zeta.xml >> ..\OnlineUpdater.cmd
echo pause >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OfflineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter ^^^(with the colon!^^^) of the connected device in mass storage mode ^^^(e.g. D:^^^): >> ..\OfflineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\zeta.xml -p %%DrivePath%% >> ..\OfflineUpdater.cmd
echo pause >> ..\OfflineUpdater.cmd

echo apps\IPA > filelist_zeta.txt
echo CODE_OF_CONDUCT.md >> filelist_zeta.txt
echo components\ANYSOC\Changelog >> filelist_zeta.txt
echo components\ANYSOC\Hardware\HARDWARE.DOCKING.SURFACE >> filelist_zeta.txt
echo components\ANYSOC\Hardware\HARDWARE.INPUT.SURFACE >> filelist_zeta.txt
echo components\ANYSOC\Hardware\HARDWARE.POSTURES.DESKTOP >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS >> filelist_zeta.txt
echo components\Devices\Zeta >> filelist_zeta.txt
echo components\QC8350 >> filelist_zeta.txt
echo definitions\Desktop\ARM64\Internal\zeta.xml >> filelist_zeta.txt
echo tools\DriverUpdater >> filelist_zeta.txt
echo LICENSE.md >> filelist_zeta.txt
echo OfflineUpdater.cmd >> filelist_zeta.txt
echo OnlineUpdater.cmd >> filelist_zeta.txt
echo README.md >> filelist_zeta.txt

cd ..
"tools\7z.exe" a -t7z ..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Desktop-Zeta.7z @tools\filelist_zeta.txt -scsWIN
cd tools

del ..\OfflineUpdater.cmd
del ..\OnlineUpdater.cmd
del filelist_zeta.txt