@echo off
set EFIESP=F:
set MainOS=G:

ren %EFIESP%\efi\Microsoft\Boot\SecureBootPolicy.p7b SecureBootPolicy.p7b.bak
copy SiPolicy.p7b %EFIESP%\efi\Microsoft\Boot\

reg load HKLM\RTS %MainOS%\Windows\System32\config\SYSTEM
reg import RIL.reg
reg unload HKLM\RTS