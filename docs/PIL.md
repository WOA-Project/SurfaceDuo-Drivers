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
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

**Below regions are not hardcoded in ACPI tables / firmware and are therefore dynamically used by the Operating System**

For this kind of region, the PIL driver is instructed the total size of the region in use dynamically below using "PGCM":

- PGCM:  Start 0x8BD80000, End 0x9A500000, Size 0x0E780000
    - Defined in \components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE_MINIMAL\Drivers\SOC\HexagonLoader\qcpil8150.inf

We then define every firmware binary meant to load in such region:

**Gap Here From 0x8BD80000 to 0x8BE00000**

- ADSP:  Start 0x8BE00000, End 0x8D800000, Size 0x01A00000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_adsp8150.inf
- MODEM: Start 0x8D800000, End 0x96E00000, Size 0x09600000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_mpss8150.inf
- VENUS: Start 0x96E00000, End 0x97300000, Size 0x00500000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
- SLPI:  Start 0x97300000, End 0x98700000, Size 0x01400000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_scss8150.inf
- IPA:   Start 0x98700000, End 0x98800000, Size 0x00100000 
    - Defined \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
- SPSS:  Start 0x98800000, End 0x98900000, Size 0x00100000
    - Defined \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
- CDSP:  Start 0x98900000, End 0x99D00000, Size 0x01400000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_cdsp8150.inf

**Gap Here From 0x99D00000 to 0x9A500000**

You will notice we have some fully dynamic regions, these usually fill in above mentioned gaps:

- GFXSUC: Size: 0x00005000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

```ini
HKR, SubsystemLoad\GFXSUC, MemoryAlignment,   %REG_DWORD%, 0x00001000
HKR, SubsystemLoad\GFXSUC, MemoryReservation, %REG_DWORD%, 0x00005000
```

- MBA: Size: 0x00100000
    - Defined in \components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

```ini
HKR, SubsystemLoad\MBA,    MemoryAlignment,   %REG_DWORD%, 0x00100000
```

**Below region is the communication buffer region to allow QMI messaging between MPSS and the OS and must be reserved**

- DHMS:  Start 0x9A500000, End 0x9AB00000, Size 0x00600000
    - Defined in ACPI DSDT, Device(QSM)

We reached the end of the whole reserved region in our UEFI firmware.

---

### INF Packages

\components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE_MINIMAL\Drivers\SOC\HexagonLoader\qcpil8150.inf

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

\components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\HexagonLoader\qcpilEXT8150.inf

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

\components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_adsp8150.inf

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

\components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_cdsp8150.inf

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

\components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_mpss8150.inf

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

\components\QC8150\Device\DEVICE.SOC_QC8150.HANA\Extensions\Subsystems\qcsubsys_ext_scss8150.inf

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

## MTP08350 Platform ID Case Study

### Windows Firmware Information

The entire PIL region **allocated** by the UEFI firmware is:

- Start: 0x85200000
- End:   0x9BE00000
- Size:  0x16C00000

(Refer to the section named UEFI Memory Map for more information on how this is defined).

### Breakdown of the different subsections of the PIL region:

| FW Name      | CAMERA     | VENUS      | EVA        | ADSP       | SLPI       | CDSP       | IPA        | GAP0       | GFXSUC     | GAP1       | SPSS       | GAP2       | MODEM      | DHMS       |
|--------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|
| Memory Set   | Hardcoded  | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       | PGCM       |
| Memory Start | 0x85200000 | 0x85700000 | 0x85C00000 | 0x86100000 | 0x88200000 | 0x89700000 | 0x8B500000 | 0x8B510000 | 0x8B51A000 | 0x8B51C000 | 0x8B600000 | 0x8B700000 | 0x8B800000 | 0x9B800000 |
| Memory End   | 0x85700000 | 0x85C00000 | 0x86100000 | 0x88200000 | 0x89700000 | 0x8B500000 | 0x8B510000 | 0x8B51A000 | 0x8B51C000 | 0x8B600000 | 0x8B700000 | 0x8B800000 | 0x9B800000 | 0x9BE00000 |
| Memory Size  | 0x00500000 | 0x00500000 | 0x00500000 | 0x02100000 | 0x01500000 | 0x01E00000 | 0x00010000 | 0x0000A000 | 0x00002000 | 0x000E4000 | 0x00100000 | 0x00100000 | 0x10000000 | 0x00600000 |
| Config       | PILE       | PILE       | PILE       | SUBA, PILE | SUBS, PILE | SUBC, PILE | PILE       |            | PILE       |            | SUBSPSS    |            | SUBM       | PILE       |

PGCM area is configured in PILE (qcpilEXT8350) and must match above table allocation plan.

**Below regions are hardcoded in ACPI tables / firmware and are therefore not dynamically used by the Operating System**

- CAMERA: Start 0x85200000, End 0x85700000, Size 0x00500000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

**Below regions are not hardcoded in ACPI tables / firmware and are therefore dynamically used by the Operating System**

For this kind of region, the PIL driver is instructed the total size of the region in use dynamically below using "PGCM":

- PGCM:   Start 0x85700000, End 0x9BE00000, Size 0x16700000
    - Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

We then define every firmware binary meant to load in such region:

- VENUS:  Start 0x85700000, End 0x85C00000, Size 0x00500000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

- EVA:    Start 0x85C00000, End 0x86100000, Size 0x00500000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

- ADSP:   Start 0x86100000, End 0x88200000, Size 0x02100000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_adsp8350.inf

- SLPI:   Start 0x88200000, End 0x89700000, Size 0x01500000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_scss8350.inf

- CDSP:   Start 0x89700000, End 0x8B500000, Size 0x01E00000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_cdsp8350.inf

- IPA:    Start 0x8B500000, End 0x8B510000, Size 0x00010000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

**Gap Here From 0x8B510000 to 0x8B51A000**

- GFXSUC: Start 0x8B51A000, End 0x8B51C000, Size 0x00002000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

**Gap Here From 0x8B51C000 to 0x8B600000**

- SPSS:   Start 0x8B600000, End 0x8B700000, Size 0x00100000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_spss8350.inf

**Gap Here From 0x8B700000 to 0x8B800000**

- MODEM:  Start 0x8B800000, End 0x9B800000, Size 0x10000000
	- Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_mpss8350.inf

- DHMS:   Start 0x9B800000, End 0x9BE00000, Size 0x00600000
    - Defined in \components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

We reached the end of the whole reserved region in our UEFI firmware.

---

### INF Packages

\components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\HexagonLoader\qcpilext8350.inf

```ini
[PILReg_Common]
HKR, SubsystemLoad\VENUS,  MemoryAlignment, %REG_DWORD%, 0
HKR, SubsystemLoad\GFXSUC, MemoryAlignment, %REG_DWORD%, 0x00001000
; Venus registry values
HKR, SubsystemLoad\VENUS, MemoryReservation, %REG_DWORD%, 0x00500000
; GFX registry values
HKR, SubsystemLoad\GFXSUC, MemoryReservation, %REG_DWORD%, 0x00002000

; CAMERA registry values
HKR, SubsystemLoad\CAMERA, MemoryAddress,     %REG_DWORD%, 0x85200000
HKR, SubsystemLoad\CAMERA, MemoryReservation, %REG_DWORD%, 0x00500000
; Venus registry values
HKR, SubsystemLoad\VENUS, MemoryAddress, %REG_DWORD%, 0x85700000
; EVA registry values
HKR, SubsystemLoad\EVA, MemoryAddress,     %REG_DWORD%, 0x85C00000
HKR, SubsystemLoad\EVA, MemoryReservation, %REG_DWORD%, 0x00500000
; ADSP registry values
HKR, SubsystemLoad\ADSP, MemoryAddress, %REG_DWORD%, 0x86100000
; SLPI registry values
HKR, SubsystemLoad\SLPI, MemoryAddress, %REG_DWORD%, 0x88200000
; CDSP registry values
HKR, SubsystemLoad\CDSP, MemoryAddress, %REG_DWORD%, 0x89700000
; IPA registry values
HKR, SubsystemLoad\IPA, MemoryAddress,     %REG_DWORD%, 0x8B500000
HKR, SubsystemLoad\IPA, MemoryReservation, %REG_DWORD%, 0x00010000
; GFX registry values
HKR, SubsystemLoad\GFXSUC, MemoryAddress, %REG_DWORD%, 0x8B51A000

;DHMS region need to be added as a region under SubsystemLoad like below as we do not want 
;PIL to use or operate on this region which is not managed by PIL by any means.
;DHMS is managed by QSM device of subsys
HKR, SubsystemLoad\DHMS, MemoryAddress,     %REG_DWORD%, 0x9B800000
HKR, SubsystemLoad\DHMS, MemoryReservation, %REG_DWORD%, 0x00600000
HKR, SubsystemLoad\DHMS, MemoryAlignment,   %REG_DWORD%, 0x00100000
;0x0 - PIL-Region to be included in PGCM and usable by PIL driver.
;0x1 - PIL-Region to be excluded from PGCM and not-usable by PIL driver.
;0x2 - PIL-Region to be excluded from PGCM and to be returned to HLOS.
HKR, SubsystemLoad\DHMS, MemoryAttribute, %REG_DWORD%, 0x1

;Misc
HKR, PilConfig, HypProtectionEnabled,    %REG_DWORD%, 1
HKR, PilConfig, DoNotReturnMemoryToHLOS, %REG_DWORD%, 1

;PGCM
HKR, PGCM, BaseAddress, %REG_DWORD%, 0x85700000
HKR, PGCM, Size,        %REG_DWORD%, 0x16700000

;IMEM
HKR, IMEM, BaseAddress, %REG_DWORD%, 0x146BF000
HKR, IMEM, Offset,      %REG_DWORD%, 0x94C
```

\components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_adsp8350.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\ADSP, MemoryAlignment, %REG_DWORD%, 0x00100000

[PIL_Reg_MSM]
; ADSP registry values
HKR, SubsystemLoad\ADSP, MemoryReservation, %REG_DWORD%, 0x2100000
```

\components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_cdsp8350.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\CDSP, MemoryAlignment, %REG_DWORD%, 0x00100000

[PIL_Reg_MSM]
; CDSP registry values
HKR, SubsystemLoad\CDSP, MemoryReservation, %REG_DWORD%, 0x1e00000
```

\components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_mpss8350.inf

```ini
[PIL_Reg_common]
; AMSS registry values
HKR, SubsystemLoad\MODEM, MemoryAlignment, %REG_DWORD%, 0x00400000
HKR, SubsystemLoad\MODEM, MemoryAddress,   %REG_DWORD%, 0x8B800000

[PIL_Reg_MSM]
; AMSS registry values
HKR, SubsystemLoad\MODEM, MemoryReservation, %REG_DWORD%, 0x10000000
```

\components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_scss8350.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\SLPI, MemoryAlignment, %REG_DWORD%, 0x00100000

[PIL_Reg_MSM]
; SLPI registry values
HKR, SubsystemLoad\SLPI, MemoryReservation, %REG_DWORD%, 0x1500000
```

\components\QC8350\Device\DEVICE.SOC_QC8350.LAHAINA\Extensions\Subsystems\qcsubsys_ext_spss8350.inf

```ini
[PIL_Reg_common]
HKR, SubsystemLoad\SPSS, MemoryAlignment,   %REG_DWORD%, 0x00100000
HKR, SubsystemLoad\SPSS, MemoryAddress,     %REG_DWORD%, 0x8B600000
HKR, SubsystemLoad\SPSS, MemoryReservation, %REG_DWORD%, 0x00100000
```

### UEFI Memory Map

```c
/* ... */
{"GPU PRR",           0x80880000, 0x00010000, AddMem, MEM_RES, WRITE_COMBINEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
/* ... */
{"MPSS_EFS",          0x82480000, 0x00280000, AddMem, SYS_MEM, SYS_MEM_CAP, Reserv, UNCACHED_UNBUFFERED_XN},
/* ... */
{"PIL Reserved",      0x85200000, 0x16C00000, AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN},
/* ... */
```

### Android Firmware Information

#### Device Tree

```dts
hyp_mem: hyp_region@80000000 {
	no-map;
	reg = <0x0 0x80000000 0x0 0x600000>;
};
 
xbl_aop_mem: xbl_aop_region@80700000 {
	no-map;
	reg = <0x0 0x80700000 0x0 0x160000>;
};

xbl_apps_hob_mem: xbl_apps_hob_mem@e3400000 {
	no-map;
	reg = <0x0 0xe3400000 0x0 0x1000>;
};

pon_info_hob_mem: pon_info_hob_mem@e3401000 {
	no-map;
	reg = <0x0 0xe3401000 0x0 0x1000>;
};

cmd_db: reserved-memory@80860000 {
	compatible = "qcom,cmd-db";
	no-map;
	reg = <0x0 0x80860000 0x0 0x20000>;
};

reserved_xbl_uefi_log: res_xbl_uefi_log_region@80880000 {
	no-map;
	reg = <0x0 0x80880000 0x0 0x14000>;
};

smem_mem: smem_region@80900000 {
	no-map;
	reg = <0x0 0x80900000 0x0 0x200000>;
};

cpucp_fw_mem: cpucp_fw_region@80b00000 {
	no-map;
	reg = <0x0 0x80b00000 0x0 0x100000>;
};

cdsp_secure_heap: cdsp_secure_heap@80c00000 {
	no-map;
	reg = <0x0 0x80c00000 0x0 0x4600000>;
};

pil_camera_mem: pil_camera_region@85200000 {
	no-map;
	reg = <0x0 0x85200000 0x0 0x500000>;
};

pil_video_mem: pil_video_region@85700000 {
	no-map;
	reg = <0x0 0x85700000 0x0 0x500000>;
};

pil_cvp_mem: pil_cvp_region@85c00000 {
	no-map;
	reg = <0x0 0x85c00000 0x0 0x500000>;
};

pil_adsp_mem: pil_adsp_region@86100000 {
	no-map;
	reg = <0x0 0x86100000 0x0 0x2100000>;
};

pil_slpi_mem: pil_slpi_region@88200000 {
	no-map;
	reg = <0x0 0x88200000 0x0 0x1500000>;
};

pil_cdsp_mem: pil_cdsp_region@89700000 {
	no-map;
	reg = <0x0 0x89700000 0x0 0x1e00000>;
};

pil_ipa_fw_mem: pil_ipa_fw_region@8b500000 {
	no-map;
	reg = <0x0 0x8b500000 0x0 0x10000>;
};

pil_ipa_gsi_mem: pil_ipa_gsi_region@8b510000 {
	no-map;
	reg = <0x0 0x8b510000 0x0 0xa000>;
};

pil_gpu_mem: pil_gpu_region@8b51a000 {
	no-map;
	reg = <0x0 0x8b51a000 0x0 0x2000>;
};

pil_spss_mem: pil_spss_region@8b600000 {
	no-map;
	reg = <0x0 0x8b600000 0x0 0x100000>;
};

pil_modem_mem: modem_region@8b800000 {
	no-map;
	reg = <0x0 0x8b800000 0x0 0x10000000>;
};

hyp_reserved_mem: qheebsp_dbg_vm_hyp_region@d0000000 {
	no-map;
	reg = <0x0 0xd0000000 0x0 0x800000>;
};

pil_trustedvm_mem: pil_trustedvm_region@d0800000 {
	no-map;
	reg = <0x0 0xd0800000 0x0 0x76f7000>;
};

qrtr_shbuf: qrtr-shmem {
	no-map;
	reg = <0x0 0xd7ef7000 0x0 0x9000>;
};

chan0_shbuf: neuron_block@0 {
	no-map;
	reg = <0x0 0xd7f00000 0x0 0x80000>;
};

chan1_shbuf: neuron_block@1 {
	no-map;
	reg = <0x0 0xd7f80000 0x0 0x80000>;
};

removed_mem: removed_region@d8800000 {
	no-map;
	reg = <0x0 0xd8800000 0x0 0x6800000>;
};

adsp_mem: adsp_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0xC00000>;
};

sdsp_mem: sdsp_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x800000>;
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

qseecom_mem: qseecom_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1400000>;
};

qseecom_ta_mem: qseecom_ta_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1000000>;
};

secure_display_memory: secure_display_region { 
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0xA400000>;
};

cnss_wlan_mem: cnss_wlan_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1400000>;
};


qcom: ramoops {
	compatible = "ramoops";
	reg = <0x0 0xa9000000 0x0 0x200000>;
	pmsg-size = <0x200000>;
	mem-type = <2>;
};


linux,cma {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x2000000>;
	linux,cma-default;
};

dump_mem: mem_dump_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	size = <0 0x3000000>;
};

sp_mem: sp_region {  
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1000000>;
};

audio_cma_mem: audio_cma_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x1C00000>;
};

splash_memory:splash_region {
	reg = <0x0 0xe1000000 0x0 0x02300000>;
	label = "cont_splash_region";
};


demura_memory_0: demura_region_0 {
	reg = <0x0 0x0 0x0 0x0>;
	label = "demura hfc region 0";
};

demura_memory_1: demura_region_1 {
	reg = <0x0 0x0 0x0 0x0>;
	label = "demura hfc region 1";
};

dfps_data_memory: dfps_data_region {
	reg = <0x0 0xe3300000 0x0 0x0100000>;
	label = "dfps_data_region";
};

memshare_mem: memshare_region {
	compatible = "shared-dma-pool";
	no-map;
	
	alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
	alignment = <0x0 0x100000>;
	size = <0x0 0x800000>;
};

non_secure_display_memory: non_secure_display_region {
	compatible = "shared-dma-pool";
	alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
	reusable;
	alignment = <0x0 0x400000>;
	size = <0x0 0x6400000>;
};
```

#### XBL

```ini
0x85200000, 0x16600000, "PIL Reserved",      AddMem, MEM_RES, UNCACHEABLE, Reserv, UNCACHED_UNBUFFERED_XN
```

---

_**© 2020-2024 The Duo WOA Authors**_

_Snapdragon is a registered trademark of Qualcomm Incorporated. Microsoft, the Microsoft Corporate Logo, Windows, Surface, Surface Duo, Windows Hello, Continuum, Hyper-V, and DirectX are registered trademarks of Microsoft Corporation in the United States. Android is a registered trademark of Google LLC. Miracast is a registered trademark of the Wi-Fi Alliance. Other binaries may be copyright Qualcomm Incorporated and Microsoft Surface._

_**Limited emergency calling**_

_Running Windows on your Surface Duo is not a replacement for a proper phone operating system and does not have emergency calling capabilities._

_**Hello from Seattle (US), France, Italy.**_