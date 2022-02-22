@echo off
setlocal EnableDelayedExpansion
:main
echo 1 - Download Video
choice /c 1 /n >nul
if %errorlevel%==1 (cls&goto downloadoptions)
:downloadoptions
echo What is the video URL?
set /p videourl=
cls
echo Choose a video quality:
echo.
echo 1 - 4K ^(3840x2160)
echo 2 - 1080P ^(1920x1080)
echo 3 - 720P ^(1280x720)
echo 4 - 480P ^(854x480)
echo 5 - 240P ^(426x240)
choice /c 12345 /n >nul
if %errorlevel%==1 (
set quality=1
goto download
)
if %errorlevel%==2 (
set quality=2
goto download
)
if %errorlevel%==3 (
set quality=3
goto download
)
if %errorlevel%==4 (
set quality=4
goto download
)
if %errorlevel%==5 (
set quality=5
goto download
)
:download
cls
if %quality%==1 (
yt-dlp.exe --format-sort res:2160 !videourl!
)
if %quality%==2 (
yt-dlp.exe --format-sort res:1080 !videourl!
)
if %quality%==3 (
yt-dlp.exe --format-sort res:720 !videourl!
)
if %quality%==4 (
yt-dlp.exe --format-sort res:480 !videourl!
)
if %quality%==5 (
yt-dlp.exe --format-sort res:240 !videourl!
)