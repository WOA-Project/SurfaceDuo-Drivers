@echo off

mkdir ..\..\SurfaceDuo-Drivers-Release
del ..\..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Desktop-Epsilon.7z

echo @echo off > ..\OnlineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OnlineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OnlineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\epsilon.xml >> ..\OnlineUpdater.cmd
echo pause >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OfflineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter ^^^(with the colon!^^^) of the connected device in mass storage mode ^^^(e.g. D:^^^): >> ..\OfflineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\epsilon.xml -p %%DrivePath%% >> ..\OfflineUpdater.cmd
echo pause >> ..\OfflineUpdater.cmd

echo apps\IPA > filelist_epsilon.txt
echo CODE_OF_CONDUCT.md >> filelist_epsilon.txt
echo components\ANYSOC\Changelog >> filelist_epsilon.txt
echo components\ANYSOC\Hardware\HARDWARE.DOCKING.SURFACE >> filelist_epsilon.txt
echo components\ANYSOC\Hardware\HARDWARE.INPUT.SURFACE >> filelist_epsilon.txt
echo components\ANYSOC\Hardware\HARDWARE.POSTURES.DESKTOP >> filelist_epsilon.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_epsilon.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE >> filelist_epsilon.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_epsilon.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL >> filelist_epsilon.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS >> filelist_epsilon.txt
echo components\QC8150\Device\DEVICE.SOC_QC8150.EPSILON >> filelist_epsilon.txt
echo components\QC8150\Device\DEVICE.SOC_QC8150.EPSILON_MINIMAL >> filelist_epsilon.txt
echo components\QC8150\Graphics\GRAPHICS.SOC_QC8150.EPSILON_DESKTOP >> filelist_epsilon.txt
echo components\QC8150\OEM\OEM.SOC_QC8150.SURFACE >> filelist_epsilon.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE >> filelist_epsilon.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE_MINIMAL >> filelist_epsilon.txt
echo definitions\Desktop\ARM64\Internal\epsilon.xml >> filelist_epsilon.txt
echo definitions\Desktop\ARM64\PE\epsilon.xml >> filelist_epsilon.txt
echo tools\DriverUpdater >> filelist_epsilon.txt
echo LICENSE.md >> filelist_epsilon.txt
echo OfflineUpdater.cmd >> filelist_epsilon.txt
echo OnlineUpdater.cmd >> filelist_epsilon.txt
echo README.md >> filelist_epsilon.txt

cd ..
"tools\7z.exe" a -t7z ..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Desktop-Epsilon.7z @tools\filelist_epsilon.txt -scsWIN
cd tools

del ..\OfflineUpdater.cmd
del ..\OnlineUpdater.cmd
del filelist_epsilon.txt