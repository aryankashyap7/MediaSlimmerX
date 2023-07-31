# Media Slimmer X

<p align="center">
  <img src="logo.jpg" alt="Media Slimmer X Logo" width="400" height="400">
</p>

Media Slimmer X is a command-line utility that utilizes FFmpeg to convert supported video files into the MP4 format with compression. The application is designed to help users reduce the file size of their video files while maintaining a reasonable level of video quality.

## Features

- Converts various video file types (`.mp4`, `.mkv`, `.avi`, `.ts`) to MP4 format.
- Applies video compression using the H.264 codec to reduce file sizes.
- Rescales videos to a height of 1080 pixels while preserving the aspect ratio.
- Uses AAC audio codec for audio compression.
- Preserves the original video's creation date and time metadata.

## Use Case

Media Slimmer X is particularly useful for scenarios where large video files need to be optimized for storage, sharing, or online streaming. By converting and compressing video files to the MP4 format, users can significantly reduce file sizes without compromising video quality drastically.

## Requirements

- Windows operating system
- FFmpeg executable available at the specified `ffmpeg_path`.

## How It Works

1. Ensure that FFmpeg is installed on your system and set the correct path for the `ffmpeg_path` variable in the script to point to the FFmpeg executable.

2. Place the video files you want to convert in the same directory as the script.

3. Execute the batch script by double-clicking on it or running it from the Command Prompt.

4. Media Slimmer X will automatically create an `output_folder` directory to store the converted MP4 files.

5. The script will generate a log file named `output_log.txt`, containing information about supported video files and their creation dates and times.

6. For each supported video file listed in the log, the script will perform the following steps:

   1. Convert the video to MP4 using FFmpeg while applying compression, rescaling, and using AAC audio codec.
   2. Preserve the original creation date and time metadata in the converted file.

7. The converted MP4 files will be saved in the `output_folder`, and the original video files will remain untouched.

## Limitations

- The application currently supports only the listed video file types: `.mp4`, `.mkv`, `.avi`, and `.ts`.
- Metadata (e.g., subtitles, chapters) from the original video files won't be transferred to the generated MP4 files, as the script removes all metadata from the conversion output to avoid potential issues with duplication.

## Changes to Be Made

Before running the application, make sure to:

1. Set the correct `ffmpeg_path` variable in the script to point to the location of the FFmpeg executable on your system. For example:

   ```batch
   set "ffmpeg_path=C:\Users\YourUsername\Downloads\ffmpeg\ffmpeg.exe"

2. Optionally, adjust the video compression settings (e.g., -crf value, -preset) in the script according to your preferences.

Note: Use this application responsibly and ensure you have the necessary rights to modify and distribute the video files. It is always recommended to keep backups of the original files before running any conversion process.
