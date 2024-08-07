# ACPI Platform Identifiers

## Snapdragon 855

### CDP

| ACPI _SUB String (Subsystem/Platform ID) | Matching SOID (SoC ID) | Matching PLST (Platform Subtype) | Friendly Name      |
|------------------------------------------|------------------------|----------------------------------|--------------------|
| CDP08150                                 | 339                    | 0                                | MSM™               |
| CDP18150                                 | 339                    | 1                                | MSM™ + SDX50M      |
| CDP28150                                 | 339                    | 2                                | MSM™ + SDX55M v1   |
| CDP38150                                 | 339                    | 3                                | MSM™ + SDX55M v3   |
| CDP48150                                 | 339                    | 4                                | MSM™ + SDX55M v2   |
| CDP58150                                 | 339                    | 5                                | MSM™ + SDX60       |
| CDP68150                                 | 339                    | 6                                | MSM™ + SDX65       |
| CDPA8150                                 | 361                    | 0                                | APQ™               |
| CDPB8150                                 | 361                    | 1                                | APQ™ + SDX50M      |
| CDPC8150                                 | 361                    | 2                                | APQ™ + SDX55M v1   |
| CDPD8150                                 | 361                    | 3                                | APQ™ + SDX55M v3   |
| CDPE8150                                 | 361                    | 4                                | APQ™ + SDX55M v2   |
| CDPF8150                                 | 361                    | 5                                | APQ™ + SDX60       |
| CDPG8150                                 | 361                    | 6                                | APQ™ + SDX65       |

### MTP

| ACPI _SUB String (Subsystem/Platform ID) | Matching SOID (SoC ID) | Matching PLST (Platform Subtype) | Friendly Name      |
|------------------------------------------|------------------------|----------------------------------|--------------------|
| MTP08150                                 | 339                    | 0                                | MSM™               |
| MTP18150                                 | 339                    | 1                                | MSM™ + SDX50M      |
| MTP28150                                 | 339                    | 2                                | MSM™ + SDX55M v1   |
| MTP38150                                 | 339                    | 3                                | MSM™ + SDX55M v3   |
| MTP48150                                 | 339                    | 4                                | MSM™ + SDX55M v2   |
| MTP58150                                 | 339                    | 5                                | MSM™ + SDX60       |
| MTP68150                                 | 339                    | 6                                | MSM™ + SDX65       |
| MTPA8150                                 | 361                    | 0                                | APQ™               |
| MTPB8150                                 | 361                    | 1                                | APQ™ + SDX50M      |
| MTPC8150                                 | 361                    | 2                                | APQ™ + SDX55M v1   |
| MTPD8150                                 | 361                    | 3                                | APQ™ + SDX55M v3   |
| MTPE8150                                 | 361                    | 4                                | APQ™ + SDX55M v2   |
| MTPF8150                                 | 361                    | 5                                | APQ™ + SDX60       |
| MTPG8150                                 | 361                    | 6                                | APQ™ + SDX65       |

### RUMI

| ACPI _SUB String (Subsystem/Platform ID) | Matching SOID (SoC ID) | Matching PLST (Platform Subtype) | Friendly Name      |
|------------------------------------------|------------------------|----------------------------------|--------------------|
| RUMI8150                                 | 339                    | 0                                | Emulation Platform |

### HDK

| ACPI _SUB String (Subsystem/Platform ID) | Matching SOID (SoC ID) | Matching PLST (Platform Subtype) | Friendly Name      |
|------------------------------------------|------------------------|----------------------------------|--------------------|
| HDK08150                                 | 339                    | 0                                | MSM™               |
| HDKA8150                                 | 361                    | 0                                | APQ™               |

### QRD

| ACPI _SUB String (Subsystem/Platform ID) | Matching SOID (SoC ID) | Matching PLST (Platform Subtype) | Friendly Name      |
|------------------------------------------|------------------------|----------------------------------|--------------------|
| QRD08150                                 | 339                    | 0                                | MSM™               |
| QRD18150                                 | 339                    | 1                                | MSM™ + SDX50M      |
| QRDA8150                                 | 361                    | 0                                | APQ™               |
| QRDB8150                                 | 361                    | 1                                | APQ™ + SDX50M      |

# Device Tree Platform Identifiers

## Snapdragon 855

### CDP

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
sm8150-v2-cdp.dts                        | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-cdp.dts                          | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-v2-cdp.dts                       | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-cdp-overlay.dts                   | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-cdp.dts                           | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-sdx50m-cdp-overlay.dts            | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 1)             |
sm8150-sdxprairie-cdp-overlay.dts        | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 2)             |
sm8150-sdxprairie-v2-cdp-overlay.dts     | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 4)             |
sm8150-marmot-cdp-overlay.dts            | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 5)             |
sm8150-lemur-cdp-overlay.dts             | Lequal(\\\_SB_.PSUB, "CDP08150") && Lequal(\\\_SB_.PLST, 6)             |

### MTP

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
sm8150-mtp-overlay.dts                   | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-mtp.dts                           | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-v2-mtp.dts                        | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-mtp.dts                          | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-v2-mtp.dts                       | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-sdx50m-mtp-2.5k-panel-overlay.dts | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 1)             |
sm8150-sdx50m-mtp-overlay.dts            | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 1)             |
sm8150-sdxprairie-mtp-overlay.dts        | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 2)             |
sm8150-sdxprairie-v3-mtp-overlay.dts     | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 3)             |
sm8150-sdxprairie-v2-mtp-overlay.dts     | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 4)             |
sm8150-marmot-mtp-overlay.dts            | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 5)             |
sm8150-lemur-mtp-overlay.dts             | Lequal(\\\_SB_.PSUB, "MTP08150") && Lequal(\\\_SB_.PLST, 6)             |

### RUMI

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
sm8150-rumi-overlay.dts                  | Lequal(\\\_SB_.PSUB, "RUMI8150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-rumi.dts                          | Lequal(\\\_SB_.PSUB, "RUMI8150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-v2-rumi.dts                       | Lequal(\\\_SB_.PSUB, "RUMI8150") && Lequal(\\\_SB_.PLST, 0)             |

### HDK

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
sm8150-hdk-overlay.dts                   | Lequal(\\\_SB_.PSUB, "HDK08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-hdk.dts                           | Lequal(\\\_SB_.PSUB, "HDK08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-hdk.dts                          | Lequal(\\\_SB_.PSUB, "HDK08150") && Lequal(\\\_SB_.PLST, 0)             |

### QRD

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
sm8150-qrd-dvt-overlay.dts               | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-qrd-overlay.dts                   | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-qrd.dts                           | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-v2-qrd-dvt.dts                    | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-v2-qrd.dts                        | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-qrd.dts                          | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150p-v2-qrd.dts                       | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 0)             |
sm8150-sdx50m-qrd-overlay.dts            | Lequal(\\\_SB_.PSUB, "QRD08150") && Lequal(\\\_SB_.PLST, 1)             |

---

_**© 2020-2024 The Duo WOA Authors**_

_Snapdragon is a registered trademark of Qualcomm Incorporated. Microsoft, the Microsoft Corporate Logo, Windows, Surface, Surface Duo, Windows Hello, Continuum, Hyper-V, and DirectX are registered trademarks of Microsoft Corporation in the United States. Android is a registered trademark of Google LLC. Miracast is a registered trademark of the Wi-Fi Alliance. Other binaries may be copyright Qualcomm Incorporated and Microsoft Surface._

_**Limited emergency calling**_

_Running Windows on your Surface Duo is not a replacement for a proper phone operating system and does not have emergency calling capabilities._

_**Hello from Seattle (US), France, Italy.**_