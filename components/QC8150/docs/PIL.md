# PIL Memory Region Settings Assignment

## MTP08150 Platform ID Case Study

### Windows Firmware Information

The entire PIL region **allocated** by the UEFI firmware is:

- Start: 0x8B700000
- End:   0x9AB00000
- Size:  0x0F400000

(Refer to the section named UEFI Memory Map for more information on how this is defined).

### Breakdown of the different subsections of the PIL region:

| FW Name      | ICP        | WCNSS      | GAP0       | ADSP       | MODEM      | VENUS      | SLPI       | IPA        | SPSS       | CDSP       | GAP1       | DHMS       |
|--------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|
| Memory Set   | Hardcoded  | Hardcoded  | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | Hardcoded  |
| Memory Start | 0x8B700000 | 0x8BC00000 | 0x8BD80000 | 0x8BE00000 | 0x8D800000 | 0x96E00000 | 0x97300000 | 0x98700000 | 0x98800000 | 0x98900000 | 0x99D00000 | 0x9A500000 |
| Memory End   | 0x8BC00000 | 0x8BD80000 | 0x8BE00000 | 0x8D800000 | 0x96E00000 | 0x97300000 | 0x98700000 | 0x98800000 | 0x98900000 | 0x99D00000 | 0x9A500000 | 0x9AB00000 |
| Memory Size  | 0x00500000 | 0x00180000 | 0x00080000 | 0x01A00000 | 0x09600000 | 0x00500000 | 0x01400000 | 0x00100000 | 0x00100000 | 0x01400000 | 0x00800000 | 0x00600000 |
| Config       | ACPI       | ACPI, PILE |            | SUBA, PILE | SUBM       | PILE       | SUBS, PILE | PILE       | PILE       | SUBC, PILE |            | ACPI       |

PGCM area is configured in PILE (qcpilEXT8150) and must match above table allocation plan.

**Below regions are hardcoded in ACPI tables / firmware and are therefore not dynamically used by the Operating System**

- ICP:   Start 0x8B700000, End 0x8BC00000, Size 0x00500000
    - Defined in ACPI DSDT, Device(VFE0)
- WCNSS: Start 0x8BC00000, End 0x8BD80000, Size 0x00180000
    - Defined in ACPI DSDT, Device(QWLN)
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

**Below regions are not hardcoded in ACPI tables / firmware and are therefore dynamically used by the Operating System**

For this kind of region, the PIL driver is instructed the total size of the region in use dynamically below using "PGCM":

- PGCM:  Start 0x8BD80000, End 0x9A500000, Size 0x0E780000
    - Defined in \components\QC8150\PLATFORM.SOC_QC8150.BASE_MINIMAL\Drivers\SOC\HexagonLoader\qcpil8150.inf

We then define every firmware binary meant to load in such region:

**Gap Here From 0x8BD80000 to 0x8BE00000**

- ADSP:  Start 0x8BE00000, End 0x8D800000, Size 0x01A00000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_adsp8150.inf
- MODEM: Start 0x8D800000, End 0x96E00000, Size 0x09600000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_mpss8150.inf
- VENUS: Start 0x96E00000, End 0x97300000, Size 0x00500000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
- SLPI:  Start 0x97300000, End 0x98700000, Size 0x01400000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_scss8150.inf
- IPA:   Start 0x98700000, End 0x98800000, Size 0x00100000 
    - Defined \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
- SPSS:  Start 0x98800000, End 0x98900000, Size 0x00100000
    - Defined \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
- CDSP:  Start 0x98900000, End 0x99D00000, Size 0x01400000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_cdsp8150.inf

**Gap Here From 0x99D00000 to 0x9A500000**

You will notice we have some fully dynamic regions, these usually fill in above mentioned gaps:

- GFXSUC: Size: 0x00005000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

```ini
HKR, SubsystemLoad\GFXSUC, MemoryAlignment,   %REG_DWORD%, 0x00001000
HKR, SubsystemLoad\GFXSUC, MemoryReservation, %REG_DWORD%, 0x00005000
```

- MBA: Size: 0x00100000
    - Defined in \components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

```ini
HKR, SubsystemLoad\MBA,    MemoryAlignment,   %REG_DWORD%, 0x00100000
```

**Below region is the communication buffer region to allow QMI messaging between MPSS and the OS and must be reserved**

- DHMS:  Start 0x9A500000, End 0x9AB00000, Size 0x00600000
    - Defined in ACPI DSDT, Device(QSM)

We reached the end of the whole reserved region in our UEFI firmware.

---

### INF Packages

\components\QC8150\PLATFORM.SOC_QC8150.BASE_MINIMAL\Drivers\SOC\HexagonLoader\qcpil8150.inf

```ini
[SubsysReg_8150]
;Misc
HKR, PilConfig, CryptoClockAddress,    %REG_DWORD%, 0
HKR, PilConfig, CryptoClockEnableMask, %REG_DWORD%, 0
HKR, PilConfig, DisableMasterMPU,      %REG_DWORD%, 0
HKR, PilConfig, HypProtectionEnabled,  %REG_DWORD%, 1
HKR, MSAL,      Type,                  %REG_DWORD%, 1

;PGCM
HKR, PGCM, BaseAddress, %REG_DWORD%, 0x8BD80000
HKR, PGCM, Size,        %REG_DWORD%, 0xE780000
```

The main PIL driver configures a region named PGCM starting at address 0x8BD80000 and ending at address 0x9A500000 (Size: 0x0E780000)

\components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

```ini
[SubsysReg_common]
HKR, SubsystemLoad\MBA,    MemoryAlignment, %REG_DWORD%, 0x00100000
HKR, SubsystemLoad\WCNSS,  MemoryAlignment, %REG_DWORD%, 0x00100000
HKR, SubsystemLoad\VENUS,  MemoryAlignment, %REG_DWORD%, 0
HKR, SubsystemLoad\IPA,    MemoryAlignment, %REG_DWORD%, 0x00100000
HKR, SubsystemLoad\GFXSUC, MemoryAlignment, %REG_DWORD%, 0x00001000
HKR, SubsystemLoad\SPSS,   MemoryAlignment, %REG_DWORD%, 0x00100000

[SubsysReg_8150]
; WCN registry values
HKR, SubsystemLoad\WCNSS, MemoryReservation, %REG_DWORD%, 0x00180000
; Venus registry values
HKR, SubsystemLoad\VENUS, MemoryReservation, %REG_DWORD%, 0x00500000
; IPA registry values
HKR, SubsystemLoad\IPA, MemoryReservation, %REG_DWORD%, 0x00100000
; GFX registry values
HKR, SubsystemLoad\GFXSUC, MemoryReservation, %REG_DWORD%, 0x00005000
; SPSS registry values
HKR, SubsystemLoad\SPSS, MemoryReservation, %REG_DWORD%, 0x00100000

; ADSP registry values
HKR, SubsystemLoad\ADSP, MemoryAddress, %REG_DWORD%, 0x8be00000
; CDSP registry values
HKR, SubsystemLoad\CDSP, MemoryAddress, %REG_DWORD%, 0x98900000
; IPA registry values
HKR, SubsystemLoad\IPA, MemoryAddress, %REG_DWORD%, 0x98700000
; SLPI registry values
HKR, SubsystemLoad\SLPI, MemoryAddress, %REG_DWORD%, 0x97300000
; SPSS registry values
HKR, SubsystemLoad\SPSS, MemoryAddress, %REG_DWORD%, 0x98800000
; Venus registry values
HKR, SubsystemLoad\VENUS, MemoryAddress, %REG_DWORD%, 0x96e00000
; WCN registry values
HKR, SubsystemLoad\WCNSS, MemoryAddress, %REG_DWORD%, 0x8bc00000
```

\components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_adsp8150.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\ADSP, MemoryAlignment, %REG_DWORD%, 0x00100000

[PIL_Reg_MSM]
; ADSP registry values
HKR, SubsystemLoad\ADSP, MemoryReservation, %REG_DWORD%, 0x1a00000

[PIL_Reg_APQ]
; ADSP registry values
HKR, SubsystemLoad\ADSP, MemoryReservation, %REG_DWORD%, 0x1a00000
```

\components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_cdsp8150.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\CDSP, MemoryAlignment, %REG_DWORD%, 0x00100000

[PIL_Reg_MSM]
; CDSP registry values
HKR, SubsystemLoad\CDSP, MemoryReservation, %REG_DWORD%, 0x1400000

[PIL_Reg_APQ]
; CDSP registry values
HKR, SubsystemLoad\CDSP, MemoryReservation, %REG_DWORD%, 0x1400000
```

\components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_mpss8150.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\MODEM, MemoryAlignment, %REG_DWORD%, 0x00400000

[PIL_Reg_8150]
; AMSS registry values
HKR, SubsystemLoad\MODEM, MemoryAddress, %REG_DWORD%, 0x8D800000


[PIL_Reg_MSM]
; AMSS registry values
HKR, SubsystemLoad\MODEM, MemoryReservation, %REG_DWORD%, 0x9600000

[PIL_Reg_APQ]
; AMSS registry values
HKR, SubsystemLoad\MODEM, MemoryReservation, %REG_DWORD%, 0x9600000
```

\components\Devices\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_scss8150.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\SLPI, MemoryAlignment, %REG_DWORD%, 0x00100000

[PIL_Reg_MSM]
; SLPI registry values
HKR, SubsystemLoad\SLPI, MemoryReservation, %REG_DWORD%, 0x1400000

[PIL_Reg_APQ]
; SLPI registry values
HKR, SubsystemLoad\SLPI, MemoryReservation, %REG_DWORD%, 0x1400000
```

### UEFI Memory Map

```c
{"MPSS_EFS",          0x85D00000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
/* ... */
{"GPU PRR",           0x85F40000, 0x00010000, AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
/* ... */
{"PIL_REGION",        0x8B700000, 0x0F400000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
/* ... */
{"TGCM",              0x9E400000, 0x01400000, AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
```

### ACPI DSDT

```asl
Device (QSM)
{
    /* ... */
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x9A500000, 0x00600000)
        })

        Return (RBUF)
    }
    /* ... */
}
```

```asl
Device (QWLN)
{
    /* ... */
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x18800000, 0x800000)
            Memory32Fixed (ReadWrite,  0xC250000,     0x10)
            Memory32Fixed (ReadWrite, 0x8BC00000, 0x180000)
            /* ... */
        })

        Return (RBUF)
    }
    /* ... */
}
```

```asl
Device (VFE0)
{
    /* ... */
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            /* ... */
            // ICP FW
            Memory32Fixed (ReadWrite, 0x8B700000, 0x500000)
            /* ... */
        }
        /* ... */
    }
    /* ... */
}
```

### Android Firmware Information

#### Device Tree

```dts
hyp_mem: hyp_mem {
	no-map;
	reg = <0x0 0x85700000 0x0 0x600000>;
};

xbl_aop_mem: xbl_aop_mem {
	no-map;
	reg = <0x0 0x85e00000 0x0 0x140000>;
};

smem_region: smem {
	no-map;
	reg = <0x0 0x86000000 0x0 0x200000>;
};

removed_regions: removed_regions {
	no-map;
	reg = <0x0 0x86200000 0x0 0x5500000>;
};

pil_camera_mem: camera_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x8b700000 0x0 0x500000>;
};

pil_wlan_fw_mem: pil_wlan_fw_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x8bc00000 0x0 0x180000>;
};

pil_npu_mem: pil_npu_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x8bd80000 0x0 0x80000>;
};

pil_adsp_mem: pil_adsp_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x8be00000 0x0 0x1a00000>;
};

pil_modem_mem: modem_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x8d800000 0x0 0x9600000>;
};

pil_video_mem: pil_video_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x96e00000 0x0 0x500000>;
};

pil_slpi_mem: pil_slpi_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x97300000 0x0 0x1400000>;
};

pil_ipa_fw_mem: pil_ipa_fw_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x98700000 0x0 0x10000>;
};

pil_ipa_gsi_mem: pil_ipa_gsi_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x98710000 0x0 0x5000>;
};

pil_gpu_mem: pil_gpu_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x98715000 0x0 0x2000>;
};

pil_spss_mem: pil_spss_region {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x98800000 0x0 0x100000>;
};

pil_cdsp_mem: cdsp_regions {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0x98900000 0x0 0x1400000>;
};

qseecom_mem: qseecom_region {
	compatible = "shared-dma-pool";
	no-map;
	reg = <0 0x9e400000 0 0x1400000>;
};

cdsp_sec_mem: cdsp_sec_regions {
	compatible = "removed-dma-pool";
	no-map;
	reg = <0x0 0xa4c00000 0x0 0x3c00000>;
};

cont_splash_memory: cont_splash_region {
	reg = <0x0 0x9c000000 0x0 0x02400000>;
	label = "cont_splash_region";
};

disp_rdump_memory: disp_rdump_region {
	reg = <0x0 0x9c000000 0x0 0x02400000>;
	label = "disp_rdump_region";
};

adsp_mem: adsp_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1000000>;
};

cdsp_mem: cdsp_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x400000>;
};

user_contig_mem: user_contig_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1000000>;
};

qseecom_ta_mem: qseecom_ta_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1000000>;
};

sp_mem: sp_region {  
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x800000>;
};

secure_display_memory: secure_display_region { 
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0xA000000>;
};

dump_mem: mem_dump_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	size = <0 0x2400000>;
};


linux,cma {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x2800000>;
	linux,cma-default;
};
```

#### XBL

```ini
0x8B700000, 0x00100000, "PIL Reserved",      AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN
0x8B800000, 0x0E600000, "PIL Reserved II",   AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN
```

---

_**© 2020-2024 The Duo WOA Authors**_

_Snapdragon is a registered trademark of Qualcomm Incorporated. Microsoft, the Microsoft Corporate Logo, Windows, Surface, Surface Duo, Windows Hello, Continuum, Hyper-V, and DirectX are registered trademarks of Microsoft Corporation in the United States. Android is a registered trademark of Google LLC. Miracast is a registered trademark of the Wi-Fi Alliance. Other binaries may be copyright Qualcomm Incorporated and Microsoft Surface._

_**Limited emergency calling**_

_Running Windows on your Surface Duo is not a replacement for a proper phone operating system and does not have emergency calling capabilities._

_**Hello from Seattle (US), France, Italy.**_