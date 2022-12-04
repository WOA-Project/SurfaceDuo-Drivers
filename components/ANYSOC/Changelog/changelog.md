## Surface Duo Drivers BSP - Version 2212.12
**Released:** 12/4/2022 07:00 PM UTC+1

**Quality:** Preview

![Surface Duo Dual Screen Windows](https://user-images.githubusercontent.com/3755345/197420866-d3bb0534-c848-4cc2-a242-04dae48b0f6e.png)

### General information

You can view compatibility for this release, along with important information and what works, and what doesn't at this link: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Status.md


### Release notes

____________________________________________________________________________________________________________________________

#### Important information

- ⚠️⚠️ **IMPORTANT: This version of the drivers needs to be paired with UEFI version greater or equal to 2212.12.** ⚠️⚠️
- The issue affecting broken installations using Driver Updater has finally been fixed! Please make sure you download the latest version of driver updater released on 12/4/2022!

### Changelog

#### Surface Duo 1

What's new?

![Screenshot (43)](https://user-images.githubusercontent.com/3755345/205504984-7d01670a-84fc-49e6-b33e-79dc15283f08.png)

- Charging finally works under Windows! This is a first version of the charging stack, as a result a few things are currently limited. The charging input is limited to low current for safety measures while work is ongoing. Big thanks to @MollySophia for helping in this area!

![image](https://user-images.githubusercontent.com/3755345/205505394-8db8fba0-4ffd-49ad-a9df-82e33c58eae2.png)

- Adds a driver for the Qualcomm SMB1380 Secondary Charger

- Adds a driver for the Qualcomm PM8150B Fuel Gauge and Primary Charger

![CABL](https://user-images.githubusercontent.com/3755345/205505010-256dbac0-4db3-499e-9564-3d197f762ea2.png)

- Enables Content Adaptive Brightness Level. For more information about CABL please see the following article: https://support.microsoft.com/en-us/windows/content-adaptive-brightness-control-in-windows-292d1f7f-9e02-4b37-a9c8-dab3e1727e78

![image](https://user-images.githubusercontent.com/3755345/205505177-0f89352a-102b-4310-aa13-84d706d5baff.png)

- Adds support for Duo's Pedometer Sensor.

- Adds support for Duo's Light Fusion Sensor.

![New Tablet Experience FRE](https://user-images.githubusercontent.com/3755345/205505040-1bdaa28b-757b-4509-a002-5ceb5e00b0af.png)

![Tablet Settings](https://user-images.githubusercontent.com/3755345/205505059-578f64ce-a9cd-4369-b10f-a05d959dbdc6.png)

![New Tablet Experience](https://user-images.githubusercontent.com/3755345/205505062-0d0de6d6-6c5e-448d-b5e8-fdd49983dd79.png)

- The new Tablet Posture experience is now enabled for Surface Duo by default. Expect a more tablet optimized taskbar, bigger hit targets in Microsoft Edge/File Explorer, and more. For more information about tablet posture experiences, please visit the following link: https://blogs.windows.com/windows-insider/2022/02/24/announcing-windows-11-insider-preview-build-22563/

- Addresses a few issues with duplicated sensors.

- Enables smooth brightness control for both panels.

![MTP](https://user-images.githubusercontent.com/3755345/205505115-6bd15ae7-4271-4eae-a714-04fe8d739821.png)

- Addresses an issue preventing USB Function Mode from working. This issue mainly affected USB File Transfers using a computer.

- Updates Surface Duo firmware to the latest Android OTA release of November

- Long forgotten bug fixes & enhancements

- Call provisioning is work in progress, if calls do not work for you at the moment, you may need to provision the call functionality manually. (Same as on Lumia 950s: https://woa-project.github.io/LumiaWOA/guides/ican0/, value is not different between 950s and Duo either, so if you already have such value, you're good to go, this is temporary!)

__Improvements to CPU core clock frequency will come in an upcoming release__

#### Surface Duo 2

- Addresses an issue preventing USB Function Mode from working. This issue mainly affected USB File Transfers using a computer.

- Updates Surface Duo 2 firmware to the latest Android OTA release of November

- Call provisioning is work in progress, if calls do not work for you at the moment, you may need to provision the call functionality manually. (Same as on Lumia 950s: https://woa-project.github.io/LumiaWOA/guides/ican0/, value is not different between 950s and Duo either, so if you already have such value, you're good to go, this is temporary!)

### Sensor Calibration Provisioning (Mandatory)


In order to get most sensors currently working, some manual steps are required.
Please follow the steps described at https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows-SurfaceDuo1.md#temporary-and-optional-copy-over-calibration-filesconfiguration-files-for-the-sensors


It may also be possible to provision it using data from the SFPD partition exposed in windows. This manual step will not be required in future releases.


### Known issues


- Automatic Orientation only works for the left panel, using the right panel orientation sensor
- USB Dongles that are not externally powered may not currently work
- USB C Billboard devices will not currently work
- External Display Stream support will not currently work
- Additional information provided by the posture sensor is currently not available for public consumption, this includes peek events.
- Digitizers will not react to the device being folded over
- Displays will not react to the device being folded over most of the time
- Physical device data is incorrect
- Digitizers aren't calibrated correctly


### Accessing Foldable Sensors from your applications


In order to currently access the sensor data given by the foldable sensors, you need to use the following apis:


- Windows.Devices.Sensors.HingeAngleSensor*
- Windows.Internal.Devices.Sensors.FlipSensor* (2)
- Windows.Internal.System.TwoPanelHingeFolioPostureDevice* (2)


(2): These apis require the use of an externally sourced winmd available from https://github.com/ADeltaX/InternalWinMD/blob/master/%23winmd/Windows.Internal.Devices.Sensors.winmd


In the future, further apis will be functional (specifically under the Windows.System.Preview namespace). Consider this an early "thing".


The following API may be used to determine if your app is used on a dual screen device: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.windowingenvironment.getdisplayregions?view=winrt-22621

The following API may be used to determine on which display region your app is currently being shown: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.getdisplayregions?view=winrt-22621

The following API may be used to move your application to the other display: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.requestmoverelativetodisplayregion?view=winrt-22621

THe following API may be used to move your application to a specific display: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.requestmovetodisplayregion?view=winrt-22621

The following API may be used for spanning purposes: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.requestsize?view=winrt-22621

The Windowing Environment for Windows Desktop editions (outside of tablet mode) is Overlapped. Tiled is used for Tablet Mode and Windows Core OS's ModernPC.


### Code Samples

```cpp
#include <iostream>
#include <windows.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Internal.Devices.Sensors.h>
#include <winrt/Windows.Internal.System.h>
#include <winrt/Windows.System.Preview.h>
#include <winrt/Windows.UI.WindowManagement.h>
#include <winrt/Windows.Foundation.Collections.h>

using namespace std;
using namespace winrt;
using namespace Windows::Foundation;
using namespace Windows::Internal::Devices::Sensors;
using namespace Windows::Internal::System;
using namespace Windows::System::Preview;
using namespace Windows::UI::WindowManagement;
using namespace Windows::Foundation::Collections;

VOID OnFoldSensorReadingChanged(FoldSensor const&, FoldSensorReadingChangedEventArgs const& args)
{
	try {
		printf("Fold sensor state changed.\n");
		switch (args.Reading().GestureState())
		{
		case GestureState::Started:
			std::cout << "Fold started\n" << std::endl;
			break;
		case GestureState::Completed:
			std::cout << "Fold stopped\n" << std::endl;
			break;
		case GestureState::Cancelled:
			std::cout << "Fold cancelled\n" << std::endl;
			break;
		case GestureState::Unknown:
			std::cout << "Fold unknown\n" << std::endl;
			break;
		}

		for (auto panel : args.Reading().ContributingPanel())
		{
			printf("Panel: %s\n", to_string(panel).c_str());
		}
		
		std::cout << "Initial angle " << args.Reading().InitialAngle() << std::endl;
		std::cout << "Final angle " << args.Reading().FinalAngle() << std::endl;
		
		switch (args.Reading().FoldType())
		{
		case FoldType::Closing:
			std::cout << "Fold Closing\n" << std::endl;
			break;
		case FoldType::Opening:
			std::cout << "Fold Opening\n" << std::endl;
			break;
		case FoldType::NotDetected:
			std::cout << "Fold NotDetected\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

VOID PrintFolioDetails(TwoPanelFolioHingeDevicePostureReading const& args)
{
	try {
		std::cout << "Panel1 " << args.Panel1Id().c_str() << "\n" << std::endl;
		std::cout << "Panel2 " << args.Panel2Id().c_str() << "\n" << std::endl;

		std::cout << "Panel1 Orientation " << (int)args.Panel1Orientation() << "\n" << std::endl;
		std::cout << "Panel2 Orientation " << (int)args.Panel2Orientation() << "\n" << std::endl;

		switch (args.Hinge1State())
		{
		case Windows::Internal::System::HingeState::Unknown:
			std::cout << "Hinge1State Unknown\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Closed:
			std::cout << "Hinge1State Closed\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Concave:
			std::cout << "Hinge1State Concave\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Flat:
			std::cout << "Hinge1State Flat\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Convex:
			std::cout << "Hinge1State Convex\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Full:
			std::cout << "Hinge1State Full\n" << std::endl;
			break;
		}

		switch (args.Hinge2State())
		{
		case Windows::Internal::System::HingeState::Unknown:
			std::cout << "Hinge2State Unknown\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Closed:
			std::cout << "Hinge2State Closed\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Concave:
			std::cout << "Hinge2State Concave\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Flat:
			std::cout << "Hinge2State Flat\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Convex:
			std::cout << "Hinge2State Convex\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Full:
			std::cout << "Hinge2State Full\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

VOID OnFolioPostureChanged(TwoPanelFolioHingeDevicePosture const&, TwoPanelFolioHingeDevicePostureReadingChangedEventArgs const& args)
{
	try {
		printf("Folio posture sensor state changed.\n");
		PrintFolioDetails(args.Reading());
	}
	catch (...) {}
}

VOID OnSensorReadingChanged(FlipSensor const&, FlipSensorReadingChangedEventArgs const& args)
{
	try {
		printf("Flip sensor state changed.\n");
		switch (args.Reading().GestureState())
		{
		case GestureState::Started:
			std::cout << "Flip started\n" << std::endl;
			break;
		case GestureState::Completed:
			std::cout << "Flip stopped\n" << std::endl;
			break;
		case GestureState::Cancelled:
			std::cout << "Flip cancelled\n" << std::endl;
			break;
		case GestureState::Unknown:
			std::cout << "Flip unknown\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

int main()
{
    init_apartment();
	printf("Trying to get flip sensor.\n");
	try {
		FlipSensor flip = FlipSensor::GetDefaultAsync().get();
		if (flip == nullptr)
		{
			printf("Flip sensor not found.\n");
		}
		else
		{
			printf("Starting listening session for flip sensor.\n");
			flip.ReadingChanged(OnSensorReadingChanged);
		}
		printf("Press any key to stop\n");
		std::cin.get();
	}
	catch (...) {}

	printf("Trying to get folio posture sensor.\n");
	try {
		TwoPanelFolioHingeDevicePosture folioPosture = TwoPanelFolioHingeDevicePosture::GetDefaultAsync().get();
		if (folioPosture == nullptr)
		{
			printf("Folio Posture sensor not found.\n");
		}
		else
		{
			auto curpst = folioPosture.GetCurrentPostureAsync().get();
			if (curpst != nullptr)
			{
				PrintFolioDetails(curpst);
			}
			printf("Starting listening session for Folio Posture sensor.\n");
			folioPosture.PostureChanged(OnFolioPostureChanged);
		}
		printf("Press any key to stop\n");
		std::cin.get();
	}
	catch (...) {}

	printf("Trying to get fold sensor.\n");
	try {
		FoldSensor fold = FoldSensor::GetDefaultAsync().get();
		if (fold == nullptr)
		{
			printf("Fold sensor not found.\n");
		}
		else
		{
			printf("Starting listening session for fold sensor.\n");
			fold.ReadingChanged(OnFoldSensorReadingChanged);
		}
		printf("Press any key to stop\n");
		std::cin.get();
	}
	catch (...) {}
}
```

____________________________________________________________________________________________________________________________


How to offline update an existing Windows Desktop installation

- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [SurfaceDuo-Drivers-Full.zip] from https://github.com/WOA-Project/SurfaceDuo-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- Execute the following command:
  
  DriverUpdater.exe -d C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\definitions\Desktop\ARM64\Internal\epsilon.txt -r C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\ -p I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop

____________________________________________________________________________________________________________________________


How to install Windows Desktop on internal Storage

- Please follow the steps detailed at https://github.com/WOA-Project/SurfaceDuo-Guides

____________________________________________________________________________________________________________________________


### Bug reporting

This release is a Preview release. Bug exists and may happen. If you notice a bug not present in the following bug list, please report them on our Telegram Group.

-- WOA-Project Team
