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

REM Call UnrealPak to create the pak file
UnrealPak.exe "%ROOT_PATH%\%MOD_NAME%.pak" -list

@pause