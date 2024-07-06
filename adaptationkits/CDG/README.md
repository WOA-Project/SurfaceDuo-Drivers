# Building WCOS CDG (Paris' Charles De Gaulle Airport)

> [!CAUTION]
> This guide is incomplete and is work in progress. You will not currently get a working image on your own by following this.
> Do not ask for help yet. You will be ignored or told the same as above.

WCOS (Windows Core OS) CDG (Charles De Gaulle) Product, more commonly known as __Windows 10X__ or __ModernPC__ is a cancelled Operating System originally meant to run on a wide range of wide screen dual screen devices from a bunch of OEM partners, and Microsoft own Surface Neo device.

## Prerequisites

- An internet service provider
- Very Advanced IT Knowledge
- A Windows 10 build 20279 Desktop virtual machine *or* at the very maximum, Windows 11 build 22000. (Any newer OS will not work for building an image here).
- A copy of the Windows 10 build 20279 Assessment and Deployment Toolkit (ADK).
- A copy of the Windows 10X build 20279 Windows System Kit for ARM64 (Internal Variant) (Non endorsed Mirror: https://archive.org/details/windows10xuups)
- The DumpIt utility (modified)

## Environment Setup

- Install the OS in a virtual machine
- Install the Windows ADK
- Download the WSK in the virtual machine
- Clone this very repository using ```git clone https://github.com/WOA-Project/SurfaceDuo-Drivers```
- Change directory to ```SurfaceDuo-Drivers\adaptationkits\CDG```
- Move ```SurfaceDuo-Drivers\components``` to ```SurfaceDuo-Drivers\adaptationkits\CDG\MSPackages\Microsoft\Andromeda855\ARM64\fre\Drivers``` (so you get ```SurfaceDuo-Drivers\adaptationkits\CDG\MSPackages\Microsoft\Andromeda855\ARM64\fre\Drivers\components```)
- Extract your copy of the WSK into ```SurfaceDuo-Drivers\adaptationkits\MSPackages```
- Open a Command Prompt (read, cmd.exe NOT powershell.exe or pwsh.exe) as Administrator
- Change directory to ```SurfaceDuo-Drivers\adaptationkits\CDG```
- Copy ```\Program Files (x86)\Windows Kits\10\tools``` to ```SurfaceDuo-Drivers\adaptationkits\CDG``` (so you get ```SurfaceDuo-Drivers\adaptationkits\CDG\tools```)
- Export the following env variable: ```set WSKContentRoot=%CD%```

## Build

- Run ```build_epsilon.cmd```
- If you get any failure, make sure your copy has correct license xml file names under ```SurfaceDuo-Drivers\adaptationkits\CDG\MSPackages\Appx```. You may have to manually rename those!
- Once done, you will get a Flash.vhdx inside the ```SurfaceDuo-Drivers\adaptationkits\CDG\Output``` folder.
- Run ```DumpIt.exe -i Flash.vhdx -v Flash.vhdx -r```

## Install

- Flash BS_EFIESP.img to esp
- Flash OSPool.img to win
- Set ```win``` partition type guid to ```E75CAF8F-F680-4CEE-AFA3-B001E56EFC2D``` inside mass storage mode
- Reboot

## Test

- Load SB Disabled UEFI
- Install your highest set of hopes and expectations in order for the OS to boot without the need of extra duct tape (Duct tape sold separately otherwise).