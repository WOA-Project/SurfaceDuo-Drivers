# Debugging Windows on Snapdragon 855 (SM8150) Devices

## Requirements:

- UEFI compliant firmware
- SecureBoot off in the UEFI firmware
- ACPI 5.0 compliant firmware
- Windows installed on the UFS
- EFI ESP partition already provisioned
- Windows Host Computer
- WinDBG (WinDBG X/WinDBG Preview from the store will do just fine)
- USB cable
- USB support in the UEFI firmware (Windows will use said UEFI's USB protocol for debugging)

## Steps:

- Mount your phone ESP partition (we will assume here it's ```X:```)
- ```cd /d X:\EFI\Microsoft\Boot\```
- ```bcdedit /store BCD /dbgsettings NET BUSPARAMS:1 KEY:1.2.3.4 HOSTIP:169.254.255.255 PORT:50000 NODHCP```
- ```bcdedit /store BCD /set {default} debug on```

# Debugging ACPI issues

- On initial break: ```bp ACPI!DriverEntry;g;g```
- ```!amli set verboseon spewon traceon```
- ```g```

- On failure: ```!amli r```

---

_**© 2020-2024 The Duo WOA Authors**_

_Snapdragon is a registered trademark of Qualcomm Incorporated. Microsoft, the Microsoft Corporate Logo, Windows, Surface, Surface Duo, Windows Hello, Continuum, Hyper-V, and DirectX are registered trademarks of Microsoft Corporation in the United States. Android is a registered trademark of Google LLC. Miracast is a registered trademark of the Wi-Fi Alliance. Other binaries may be copyright Qualcomm Incorporated and Microsoft Surface._

_**Limited emergency calling**_

_Running Windows on your Surface Duo is not a replacement for a proper phone operating system and does not have emergency calling capabilities._

_**Hello from Seattle (US), France, Italy.**_