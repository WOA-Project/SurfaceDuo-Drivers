@echo off
REM rmdir /Q /S ..\..\SurfaceDuo-Drivers-Release
mkdir ..\..\SurfaceDuo-Drivers-Release

echo "DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\zeta.txt" >> ..\OnlineUpdater.cmd
copy ..\..\DriverUpdater\DriverUpdater\bin\arm64\Release\net8.0\publish\win-arm64\DriverUpdater.exe ..\

echo apps >> filelist_zeta.txt
echo CODE_OF_CONDUCT.md >> filelist_zeta.txt
echo components\ANYSOC\Changelog > filelist_zeta.txt
echo components\ANYSOC\Hardware\HARDWARE.DOCKING.SURFACE >> filelist_zeta.txt
echo components\ANYSOC\Hardware\HARDWARE.INPUT.SURFACE >> filelist_zeta.txt
echo components\ANYSOC\Hardware\HARDWARE.POSTURES.DESKTOP >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE_ZETA_TEMP >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL >> filelist_zeta.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS >> filelist_zeta.txt
echo components\QC8350\Device\DEVICE.SOC_QC8350.ZETA >> filelist_zeta.txt
echo components\QC8350\Device\DEVICE.SOC_QC8350.ZETA_MINIMAL >> filelist_zeta.txt
echo components\QC8350\OEM\OEM.SOC_QC8350.SURFACE >> filelist_zeta.txt
echo components\QC8350\Platform\PLATFORM.SOC_QC8350.BASE >> filelist_zeta.txt
echo components\QC8350\Platform\PLATFORM.SOC_QC8350.BASE_MINIMAL >> filelist_zeta.txt
echo definitions\Desktop\ARM64\Internal\zeta.txt >> filelist_zeta.txt
echo DriverUpdater.exe >> filelist_zeta.txt
echo LICENSE.md >> filelist_zeta.txt
echo OnlineUpdater.cmd >> filelist_zeta.txt
echo README.md >> filelist_zeta.txt

cd ..
"%ProgramFiles%\7-zip\7z.exe" a -tzip ..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Desktop-Zeta.zip @tools\filelist_zeta.txt -scsWIN
cd tools

del ..\OnlineUpdater.cmd
del ..\DriverUpdater.exe
del filelist_zeta.txt