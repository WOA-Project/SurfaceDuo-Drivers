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

## Snapdragon 888

### ATP

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
lahaina-atp-overlay.dts                  | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-atp.dts                          | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2-atp.dts                       | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2.1-atp.dts                     | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-atp-overlay.dts                 | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-atp.dts                         | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2-atp.dts                      | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2.1-atp.dts                    | Lequal(\\\_SB_.PSUB, "ATP08350") && Lequal(\\\_SB_.PLST, 0)         |

### RUMI

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
lahaina-rumi-overlay.dts                 | Lequal(\\\_SB_.PSUB, "RUMI8350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-rumi.dts                         | Lequal(\\\_SB_.PSUB, "RUMI8350") && Lequal(\\\_SB_.PLST, 0)         |

### HDK

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
lahaina-hdk-overlay.dts                  | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-hdk.dts                          | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2-hdk.dts                       | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2.1-hdk.dts                     | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-hhg-overlay.dts                  | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 1)         |
lahaina-v2.1-hhg.dts                     | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 1)         |
lahainap-hhg-hsp-pro-overlay.dts         | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 2)         |
lahainap-v2.1-hhg-hsp-pro.dts            | Lequal(\\\_SB_.PSUB, "HDK08350") && Lequal(\\\_SB_.PLST, 2)         |

### CDP

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
lahaina-cdp-overlay.dts                  | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-cdp-v2.2-overlay.dts             | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-cdp-v2.2.dts                     | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-cdp.dts                          | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2-cdp.dts                       | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2.1-cdp.dts                     | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-vm-cdp.dts                       | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-cdp-overlay.dts                 | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-cdp.dts                         | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2-cdp.dts                      | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2.1-cdp.dts                    | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2.1-cdp-hsp-pro.dts             | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 3)         |
lahaina-cdp-hsp-pro-overlay.dts          | Lequal(\\\_SB_.PSUB, "CDP08350") && Lequal(\\\_SB_.PLST, 3)         |

### MTP

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
lahaina-mtp-overlay.dts                  | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-mtp-v2-overlay.dts               | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-mtp-v2.1-overlay.dts             | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-mtp-v2.1.dts                     | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-mtp-v2.dts                       | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-mtp.dts                          | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2-mtp.dts                       | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2.1-mtp.dts                     | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-vm-mtp-v2.1.dts                  | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-vm-mtp-v2.dts                    | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-vm-mtp.dts                       | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-mtp-overlay.dts                 | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-mtp.dts                         | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2-mtp.dts                      | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2.1-mtp.dts                    | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-mtp-hsp-overlay.dts              | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 1)         |
lahaina-mtp-hsp.dts                      | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 1)         |
lahaina-mtp-hsp-pro-overlay.dts          | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 2)         |
lahaina-v2.1-mtp-hsp-pro.dts             | Lequal(\\\_SB_.PSUB, "MTP08350") && Lequal(\\\_SB_.PLST, 2)         |

### QRD

| Device Tree Source File Name           | Matching ACPI Condition (Against header values prefilled from SMEM) |
|----------------------------------------|---------------------------------------------------------------------|
lahaina-qrd-overlay.dts                  | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-qrd.dts                          | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2-qrd.dts                       | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-v2.1-qrd.dts                     | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-vm-qrd.dts                       | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-qrd-overlay.dts                 | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-qrd.dts                         | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2-qrd.dts                      | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahainap-v2.1-qrd.dts                    | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 0)         |
lahaina-qrd-hsp-overlay.dts              | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 1)         |
lahaina-qrd-hsp.dts                      | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 1)         |
lahaina-qrd-hsp-pro-overlay.dts          | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 2)         |
lahaina-v2.1-qrd-hsp-pro.dts             | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 2)         |
lahaina-qrd-module-overlay.dts           | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 8)         |
lahaina-qrd-module.dts                   | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 8)         |
lahaina-v2-qrd-module.dts                | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 8)         |
lahaina-v2.1-qrd-module.dts              | Lequal(\\\_SB_.PSUB, "QRD08350") && Lequal(\\\_SB_.PLST, 8)         |