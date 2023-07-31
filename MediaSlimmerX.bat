@echo off

:: Media Slimmer X - A command-line utility to convert video files to MP4 format with compression using FFmpeg.

:: Constants for paths
set "ffmpeg_path=C:\Users\Aryan\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-6.0-full_build\bin\ffmpeg.exe"
set "output_folder=compressed"
set "log_file=output_log.txt"

:: Create the output folder if it doesn't exist
if not exist "%output_folder%" mkdir "%output_folder%"

:: Save all the supported video file names along with creation time to a text file
echo File - Creation Date - Creation Time > "%log_file%"
(for /f "tokens=*" %%i in ('dir /B *.mp4 *.mkv *.avi *.ts') do (
    for /f "tokens=1,2 delims= " %%a in ('dir /T:C "%%i" ^| findstr "%%i"') do echo %%i - %%a - %%b
)) >> "%log_file%"

:: Loop through each supported video file listed in the text file
for /f "tokens=1,2,3 delims=-" %%a in (%log_file%) do (
    set "source_file=%%a"
    set "creation_date=%%b"
    set "creation_time=%%c"

    :: Convert the video to mp4 using ffmpeg and preserve metadata
    echo Converting "%%a" to mp4...
    "%ffmpeg_path%" -i "%%a" -vf "scale=-1:1080" -c:v libx264 -crf 23 -preset medium -c:a aac -strict experimental -map_metadata 0 -metadata:s:v:0 rotate=0 -metadata creation_time="%creation_date% %creation_time%" -y "%output_folder%\%%~na.mp4"

    echo Conversion of "%%a" to mp4 complete.

    :: Remove metadata from the converted file
    "%ffmpeg_path%" -i "%output_folder%\%%~na.mp4" -map_metadata -1 -c:v copy -c:a copy -y "%output_folder%\%%~na_temp.mp4"
    del "%output_folder%\%%~na.mp4"
    ren "%output_folder%\%%~na_temp.mp4" "%%~na.mp4"
)

:: Pause the script to keep the Command Prompt window open
pause
