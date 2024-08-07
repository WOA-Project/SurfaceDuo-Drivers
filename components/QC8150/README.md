# Windows on Snapdragon 855 Board Support Package

Welcome to the Snapdragon 855 Windows BSP Platform repository.

This repository contains drivers, components and files needed to run Windows on official Snapdragon 855 platforms such as:

- Modem Testing Platform (MTP)
- Hardware Development Kit (HDK)
- Qualcomm Reference Design (QRD)

We currently support the following chipsets:

- Snapdragon 855
- Snapdragon 855+
- Snapdragon 860

In the following variants:

- MSM
- APQ

And with the following configurations:

- Standard (Built in Snapdragon X24 LTE Modem)
- SDX50M
- SDX55M
- SDX60
- SDX65

## Currently non functional chipset features

- A specific set of onboard TLMM Interrupts **over PDC**
- Atheros Hellium FM Radio audio routing
- Battery Power Management Stack extensibility for Fuel Gauges only
- Bluetooth Handset Free Phone audio routing
- Camera Sensors
- Command Mode MIPI DSI Display Panels with Display Stream Compression **turned off** (Older driver versions can work here (WDDM 2.6))
- CPHY Mode
- Display Out over Type-C (blocked by correct PHY TypeC detection on PM8150B)
- DSP based NPU
- EarPiece audio routing, Phone Handset Mic arrays
- Gold Plus Cluter Power Management
- Hyper-V
- IOMMU Mappings for Hyper-V
- NFC (QRD)
- PCIe
- Phone Call audio routing
- PM8150B/L/A's PWM/LPG/RGB controllers (for LEDs)
- PM8150L/A PWM controller (for haptics)
- Proper Thermal and SoC bandwidth management between all components
- QuadSPI
- SMB1355 and SMB1390 dual mode (MTP)
- SMB1390 (QRD)
- TPM
- Type-C role detection (Detection is very unreliable on Windows Currently)

## Relevant Documentation

You can find a few notes under the docs folder inside this repository.

## Stay in touch!

For specific Snapdragon 855 BSP related inquiries, feel free to reach out on this github repository issue tracker, discussion board, or on telegram at:

- t.me/DuoWOA (if your question is Surface Duo related, or does not concern a specific third party OEM made phone, or is about the Snapdragon 855 BSP in general)
- t.me/woa_msmnile_issues (if your question is not Surface Duo related, or concerns a specific third party OEM made phone, or is about the Snapdragon 855 BSP in general)

(Wait for an answer as well, we are not always available for inquiries)

## Misc

These driver files are not perfect, typos may exist, feel free to file an issue on GitHub in case you found any.

## Resources

## Copyright, License, Disclaimers and end user license agreement

**Below notice must be present in all redistributed portions of this software**

Please see [LICENSE](LICENSE.md)

## Installing manually

For preserving charset encoding, please checkout with using:

```
git clone -c core.autocrlf=false https://github.com/WOA-Project/windows-hana-platforms
```
