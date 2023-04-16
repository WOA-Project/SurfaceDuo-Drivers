set _NTTREE=E:
cd /d "C:\Program Files (x86)\Windows Kits\10\tools\bin\i386\"
call imggen.cmd E:\Output\Flash.vhdx E:\OEMInput.xml E: ARM64
cd /d E: