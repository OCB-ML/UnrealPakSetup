@echo off

REM Name of the mod directory to pack
SET MOD_NAME=OcbPakMod

REM Path to the UE_Pack bin directory
REM https://github.com/allcoolthingsatoneplace/UnrealPakTool/issues/10
SET TOOL=UE_Pack\Engine\Binaries\Win64

REM Path we are currently in
SET ROOT_PATH=%~dp0

REM Add UnrealPack to global path
SET PATH=%PATH%;%TOOL%

REM Create file list for UnrealPak (use absolute path)
REM NOTE: Relative paths will resolve from bin directory
REM NOTE: Second "argument" will re-base folders in the pak
REM https://forums.unrealengine.com/t/how-to-use-unrealpak-exe-to-build-pak/403533/5
ECHO "%ROOT_PATH%\%MOD_NAME%\*.uasset" "..\..\..\*.*" > "%ROOT_PATH%\filelist.txt"
ECHO "%ROOT_PATH%\%MOD_NAME%\*.uexp" "..\..\..\*.*" >> "%ROOT_PATH%\filelist.txt"

REM Call UnrealPak to create the pak file
UnrealPak.exe "%ROOT_PATH%\%MOD_NAME%.pak" -create="%ROOT_PATH%\filelist.txt"

REM Copy the created pak to the game mod directory (optional)
cp "%ROOT_PATH%\%MOD_NAME%.pak" "G:\SteamLibrary\steamapps\common\Manor Lords\ManorLords\Content\Paks\~mods"

@pause