@ECHO OFF
SETLOCAL

:: Monterer default-profilen sin NTUSER.DAT
REG LOAD "HKEY_LOCAL_MACHINE\TempHive" "C:\Users\Default\NTUSER.DAT"


:: Importerer registry-filer
REG IMPORT "%~dp0pin.reg"


:: Avmonterer 
REG UNLOAD "HKEY_LOCAL_MACHINE\TempHive"


:: Kopier
xcopy "%~dp0PinProgram.exe" "C:\Programdata\" /C /R /H /K /Y /I /S
xcopy "%~dp0PinPrograms.vbs" "C:\Programdata\Microsoft\Windows\Start Menu\Programs\Startup\" /C /R /H /K /Y /I /S


:: Returner exit-kode til SCCM 
exit /B %EXIT_CODE%