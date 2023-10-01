# LATEST UPDATE: 11:09 PM Saturday, September 30, 2023 Coordinated Universal Time (UTC)
# THIS PROJECT IS UNDER CONSTANT DEVELOPMENT!
# rMETAshell - A Reverse Shell Metadata Injection and One-Liner Generation Toolkit

[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-red)](https://github.com/sponsors/git5loxosec) [![Kali Linux Compatible](https://img.shields.io/badge/Kali%20Linux-Compatible-brightgreen)](https://www.kali.org/)
 <img src="https://camo.githubusercontent.com/f25217d6db3b6cb603d9fb4a2b017a682aae3b1ec5c6ffab653f6cd31eceb73c/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f446576656c6f7065642532306f6e2d6b616c692532306c696e75782d626c756576696f6c6574"> 
 ![Language](https://img.shields.io/badge/Language-Bash-green.svg)
![Static](https://img.shields.io/badge/License-AGPL-3.0license-gold.svg)

<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell1.png">
Clean image file no reverse shell.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell2.png">
The reverse shell injection method used here wont affect the integrity of the image file.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell3.png">
Connection established, mission accomplished!

# Description:

rMETAshell is a command-line tool for injecting a reverse shell command into the metadata and generating one-liner execution methods.

# How It Works:
rMETAshell takes a reverse shell command and an image, video or text file as input. It then injects the command into the file using metadata comments. After injection, it generates a one-liner execution method for retrieving and executing the injected command from a remote location.

# Features:
Metadata-Based Shell Injection: Inject reverse shell commands into image, video, and text file metadata, ensuring seamless integration with target systems.

One-Liner Generation: Automatically generate one-liners for quick and efficient remote shell access. Choose from a variety of execution methods tailored to different file formats.

Supported File Formats: rMETAshell supports the following file formats for shell injection and one-liner generation:

Image Formats: JPEG, PNG, BMP, and more.
Video Formats: MP4, AVI, MKV, and others.
Text Formats: TXT, CSV, XML, and more.

# Requirements:
Linux-based operating system (Tested on Ubuntu 20.04 LTS)
Dependencies: ExifTool, Exiv2, ImageMagick (identify), FFprobe, Curl, Sed
Compatible file formats: Media (e.g., images, videos), Text files (e.g., HTML, XML)
Zip and Rar archive support

# Installation:

Clone the repository:
```
git clone https://github.com/git5loxosec/rMETAshell.git
```

Navigate to the rMETAshell directory:
```
cd rMETAshell
```

Run the script with the desired options:
```
./rMETAshell [OPTIONS] <REVERSE_SHELL_COMMAND> <filename> <URL>
Replace [OPTIONS], <REVERSE_SHELL_COMMAND>, <filename>, and <URL> with the appropriate values. For more details, use the -h or --help option.

```

Follow the prompts to select an execution method based on the file format.
**Warning: Ethical and Responsible Use Only
rMETAshell is intended for legitimate and ethical purposes, such as penetration testing, cybersecurity assessments, and educational use. Unauthorized use of this tool for malicious activities is strictly prohibited and may have serious legal consequences. Ensure that you have proper authorization and adhere to all applicable laws and regulations before using rIMGshell.**


## License


This project is licensed under the [AGPL-3.0 license](LICENSE).
