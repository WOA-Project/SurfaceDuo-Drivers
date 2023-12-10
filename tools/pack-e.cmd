@echo off
REM rmdir /Q /S ..\..\SurfaceDuo-Drivers-Release
mkdir ..\..\SurfaceDuo-Drivers-Release

echo apps\IPA > filelist_e.txt
echo CODE_OF_CONDUCT.md >> filelist_e.txt
echo components\ANYSOC\Changelog >> filelist_e.txt
echo components\ANYSOC\Hardware\HARDWARE.DOCKING.SURFACE >> filelist_e.txt
echo components\ANYSOC\Hardware\HARDWARE.INPUT.SURFACE >> filelist_e.txt
echo components\ANYSOC\Hardware\HARDWARE.POSTURES.DESKTOP >> filelist_e.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_e.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE >> filelist_e.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_e.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL >> filelist_e.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS >> filelist_e.txt
echo components\QC8550\Device >> filelist_e.txt
echo components\QC8550\Graphics >> filelist_e.txt
echo components\QC8550\Platform\PLATFORM.SOC_QC8550.BASE >> filelist_e.txt
echo components\QC8550\Platform\PLATFORM.SOC_QC8550.BASE_MINIMAL >> filelist_e.txt
echo LICENSE.md >> filelist_e.txt
echo README.md >> filelist_e.txt

cd ..
"%ProgramFiles%\7-zip\7z.exe" a -tzip ..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Desktop-E.zip @tools\filelist_e.txt -scsWIN
cd tools

del filelist_e.txt