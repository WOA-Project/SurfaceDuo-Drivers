@echo off
set EFIESP=G:
rem set MainOS=G:

ren %EFIESP%\efi\Microsoft\Boot\SecureBootPolicy.p7b SecureBootPolicy.p7b.bak
rem copy SiPolicy.p7b %EFIESP%\efi\Microsoft\Boot\

rem reg load HKLM\RTS %MainOS%\Windows\System32\config\SYSTEM
rem reg import RIL.reg
rem reg unload HKLM\RTS