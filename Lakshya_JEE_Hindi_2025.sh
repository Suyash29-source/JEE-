#!/bin/bash

echo
echo "                                        Created By PW JARVIS"
echo "                                        For assistance, please visit @PWJARVIS on Telegram"
echo "                                        ______________________________________________________\n"

# Detect Termux environment
if [ -d "/data/data/com.termux/files" ]; then
    IS_TERMUX=true
else
    IS_TERMUX=false
fi

# Termux storage verification
if [ "$IS_TERMUX" = true ]; then
    if [ ! -d "$HOME/storage/shared" ]; then
        echo "Setting up storage permissions..."
        termux-setup-storage
        echo "Please allow storage access when prompted"
        echo "Press Enter to continue after granting permission..."
        read -p ""
        sleep 7
        
        # Re-check storage permission
        if [ ! -d "$HOME/storage/shared" ]; then
            echo "Storage permission not granted. Exiting."
            exit 1
        fi
    fi
fi

# Determine package manager for non-Termux
if [ "$IS_TERMUX" = false ]; then
    if command -v apt &> /dev/null; then
        PM="apt"
    elif command -v dnf &> /dev/null; then
        PM="dnf"
    elif command -v pacman &> /dev/null; then
        PM="pacman"
    else
        echo "Unsupported package manager. Exiting."
        exit 1
    fi
fi

# Create and navigate to appropriate directory
if [ "$IS_TERMUX" = true ]; then
    cd "$HOME/storage/shared" || { echo "Failed to access shared storage"; exit 1; }
    mkdir -p "PWJarvis"
    cd "PWJarvis" || { echo "Failed to access PWJarvis directory"; exit 1; }
fi

batch="Lakshya JEE Hindi 2025"
mkdir -p "$batch" && cd "$batch"

# System dependencies check
echo "Checking system dependencies..."

# Update package lists
if [ "$IS_TERMUX" = true ]; then
    apt update -y
else
    case "$PM" in
        "apt")
            sudo apt update -y
            ;;
        "dnf")
            sudo dnf check-update -y
            ;;
        "pacman")
            sudo pacman -Sy --noconfirm
            ;;
    esac
fi

# Check and install Python (Termux only)
if [ "$IS_TERMUX" = true ]; then
    if ! command -v python3 &> /dev/null; then
        echo "Installing Python..."
        apt install python -y
    fi
fi

# Check and install FFmpeg
if ! command -v ffmpeg &> /dev/null; then
    echo "Installing FFmpeg..."
    if [ "$IS_TERMUX" = true ]; then
        apt install ffmpeg -y
    else
        case "$PM" in
            "apt")
                sudo apt install -y ffmpeg
                ;;
            "dnf")
                sudo dnf install -y ffmpeg
                ;;
            "pacman")
                sudo pacman -S --noconfirm ffmpeg
                ;;
        esac
    fi
fi

# Check and install OpenSSL
if ! command -v openssl &> /dev/null; then
    echo "Installing openssl..."
    if [ "$IS_TERMUX" = true ]; then
        apt install openssl -y
    else
        case "$PM" in
            "apt")
                sudo apt install -y openssl
                ;;
            "dnf")
                sudo dnf install -y openssl
                ;;
            "pacman")
                sudo pacman -S --noconfirm openssl
                ;;
        esac
    fi
fi

# Install yt-dlp
if ! command -v yt-dlp &> /dev/null; then
    echo "Installing yt-dlp..."
    if [ "$IS_TERMUX" = true ]; then
        pip install yt-dlp
    else
        echo "Downloading yt-dlp binary..."
        mkdir -p ~/.local/bin
        
        # Try to use available download tools
        if command -v curl &> /dev/null; then
            curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
        elif command -v wget &> /dev/null; then
            wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O ~/.local/bin/yt-dlp
        elif command -v aria2c &> /dev/null; then
            aria2c https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp --dir ~/.local/bin -o yt-dlp
        else
            echo "Installing curl to download yt-dlp..."
            case "$PM" in
                "apt")
                    sudo apt install -y curl
                    ;;
                "dnf")
                    sudo dnf install -y curl
                    ;;
                "pacman")
                    sudo pacman -S --noconfirm curl
                    ;;
            esac
            curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
        fi
        
        chmod a+rx ~/.local/bin/yt-dlp
        export PATH="$HOME/.local/bin:$PATH"
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            echo "WARNING: ~/.local/bin is not in your PATH. Add it to your shell's configuration if needed."
        fi
    fi
fi


echo ":: Subject: Physics"
mkdir -p "Physics" && cd "Physics"

echo ":: Chapter: Short Notes || (Only PDF)"
mkdir -p "Short Notes - -Only PDF" && cd "Short Notes - -Only PDF"

mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "परमाणु  Short Notes.pdf" ]; then
    echo "\nStarting download: "परमाणु  Short Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु  Short Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/d6727d97-5d73-473a-941c-f93172184db3.pdf"
else
    echo "File exists: "परमाणु  Short Notes.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Practice Sheet || Only PDF"
mkdir -p "Practice Sheet - Only PDF" && cd "Practice Sheet - Only PDF"

mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "विकिरण तथा प्रदार्थ की द्वैत प्रकृति - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा प्रदार्थ की द्वैत प्रकृति - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/fe1028a5-d01d-4ec7-bf41-32f74a8603df.pdf"
else
    echo "File exists: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c74f393c-6bbf-4864-aa0d-4b19281a67d8.pdf"
else
    echo "File exists: "तरंग प्रकाशीय - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/af61cfce-d144-4145-a955-2dffeeb5f109.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय तरंगें  - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें  - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें  - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0735f5a1-0f26-43de-834b-e59f645dc6a3.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें  - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a431175e-2440-450c-8b7b-3b1d13449e10.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण - Practice Sheet - Lakshya JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - Practice Sheet - Lakshya JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - Practice Sheet - Lakshya JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ba002e06-610b-4ef8-af70-125391beded9.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - Practice Sheet - Lakshya JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d691e565-98ce-4d47-947b-24fdc5537fb5.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व - Practice Shee.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - Practice Shee.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - Practice Shee.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d269f8ba-6a9f-486d-8d29-3d761ca1287a.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - Practice Shee.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - Practice Sheet.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b3eaba0a-5c6c-464a-84df-588918cfec73.pdf"
else
    echo "File exists: "विद्युत धारा - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - Practice Sheet .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - Practice Sheet .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - Practice Sheet .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a19bdce2-a7b9-4efc-b0de-604d38295dde.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - Practice Sheet .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - Practice Sheet.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - Practice Sheet.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - Practice Sheet.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/dfa70886-0077-4127-bf8a-85e46dd42d53.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - Practice Sheet.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - Practice Sheet .pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - Practice Sheet .pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - Practice Sheet .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/42101369-2f9b-4aeb-a9fc-a39407c14602.pdf"
else
    echo "File exists: "मूलभूत गणित - Practice Sheet .pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: NCERT Discussion"
mkdir -p "NCERT Discussion" && cd "NCERT Discussion"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjhlMzgzZTktYjMzMy00ZGM2LTkwYjktN2NlODdmZTdlZTZkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.l3rghjMU0Ksdcn3uiW8ffcQ0o9Sn4AMDQa1VDP00eWQ/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjM2MTMxZTQtNzJjMS00OTU2LWE5ZDQtNDFmNzk2ZjlhMjA4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.eaTUbnC_OJzcQOHkTRwnL6DVgPf8tSDAxVA2a3SL4F8/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGY2MTBmY2ItMjM2NS00OWYyLTkzNTEtZThlOTFmNDFmNmU5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.yQi5MzbG6dZV6Imv0ihQk47SxbQ6-E9-U3OMoMGpbAw/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYmM5ZjU4OGUtZTgxZC00NDNiLTg4NjItZmY0NmY1NDYzNzRlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.W2qr3eTfHHFwY3vgAdLbFlIQSL5vMXU3tSEdRBLuKAk/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGMzYjMwNTctNjI4MS00MjRiLTkxOGYtYTc0ZTYxNTU3MTIyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.QV2CiJb8eAVVVDeumi-7hEUPnn1oZcJhY37MQgf9PoE/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2UyNzY4NTMtM2ZjOS00ZjhhLTgwYTAtMDUyYTg4N2Y3Y2U5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.o6-a85L7XQU4srff1flyqveIRUq2V30fB-pUWlRNPbg/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmVjNjlmZmMtZDE2ZC00OTA0LWE2OWUtZDQyNTk0Yzk0MjQ2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.aKIRXtmbpX99x2JmTs3fb6SYai3xctNtlpLzz4Ag_9o/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODU0MWRkYTktMGNiYi00MjlkLWIyZmEtZmQ3NTI0YjE1ODNjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Ov0qmUFPArZmJj03rl1iCfAhBfDWCMHiO0CaiiaTDk4/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "नाभिक 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "नाभिक 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzkzZDY3ZTEtOTNkNy00NDExLWJkYzAtMjFjMGExOWJkODZhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.rp6wgndu7UkOaM2p9F2aDeaftE3v9K_UMYcSex0Lyf4/hls/360/main.m3u8"
else
    echo "File exists: "नाभिक 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "नाभिक 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "नाभिक 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTRmMGI5NjMtMTQwNy00YTVhLTk1YTYtNzMwYmMxYTQzOTE4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.jGMxPRr4O4twtqKO2jbr3dVyd9LIMr2o_jxAvAqQ1cM/hls/360/main.m3u8"
else
    echo "File exists: "नाभिक 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "परमाणु 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "परमाणु 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiM2Q1OWNmZmYtZjRhNi00YTVhLTg5ZWEtNzY0MzVhNGU3ZmI0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.sPdI5bdzmJq4R2W8g84RLu0NgyLBgjbfA5maTZkGlvI/hls/360/main.m3u8"
else
    echo "File exists: "परमाणु 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "परमाणु 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "परमाणु 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMGFkMjgyMWQtZmIyMi00NTJmLWIxNjItOGE2ZmIxZGQ2MzhlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.y9U72InoyQsUu7GYfGwhiqK8k0tk9O5QLX7uTe57_JQ/hls/360/main.m3u8"
else
    echo "File exists: "परमाणु 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjAxMDA2M2ItMDRkOS00YmYxLWEzODItODM4NzdlOGU1N2MwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.L5iWXbmLNHe6xcrIfbnvEIbHLL2M4gbkkMiw8k2i6KQ/hls/360/main.m3u8"
else
    echo "File exists: "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODMwM2UwZjEtNTkxOC00NGE5LTk0ZjktZWQ3YWU4NTcyNGY3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.giaHiBqL9Ygegl6e6wM4Pui2wcPiEwUDO1mwkWH0ot4/hls/360/main.m3u8"
else
    echo "File exists: "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWFmYzMzMWMtM2U0My00ODMxLTk2NTAtYWI4MzkwMjdjYTExIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.6w2d42TkrCfaYVL0Q-qdWE4ufvZ0AFVD1nITG1Izjz4/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWQ0ZWNiY2ItYmIyNS00ZDYwLWE0NWQtNjlhMmQ4OTY4ZmFhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.kShKSoT4akNN7kRimUaLJIMqY99isLwOISqdVELEmmo/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWNmMWEyZDYtM2NjNS00ZTk1LWEyNzctYmRmMzg3OTJmMGY4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.9b_tqBOfPwozj3zMUmNr9fbP6YkyekaEnz1jioNYXEs/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODMzYjNiOTktMDM2Ni00YmI1LWI1Y2ItZmI4MzNlNGZlZTExIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.McndM-icDrOzcAE2OoawHg-7-yBDLvAVUUGBlnyABUY/hls/360/main.m3u8"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDYyMjVjYTAtZDNmNC00ZTdmLTgxZjQtZDkxMmU4YmVlYmRhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7BltnVohzZia8RMLhk8lXY1EG3v6PCweP3BKH638M6o/hls/360/main.m3u8"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjVmMTEyOTItYjA2NC00ZjRlLThhOWEtOWVlYzM0MzgwZWFkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Ve6KJMzUxyzwrh5p5jCFUzga7agV51rXwgeXvj7eIqU/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjEzODNhNjAtMjg4NS00YjBmLWE4NTctMWViOTU3ZjYwNzk0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.eGRuo4K-w2tNdK0s42lihGdBKTjUzTeABr5Az0-D6XI/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODExMjk2ZTAtYTA2MS00MDQ1LWI0ODctNjQxNTdiZjljMDJmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.g7B5fhpB263SROdchYu_RhUQwRjuvkasVxl4quDOcC0/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjBhYmE1MDItMzA3ZS00YjgxLTk2MWEtN2E4NDhmZmRkZTIzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.42sGd2wMJ83xYJ9J2teH9-xyuZOx5j3tweJeEr2tRfU/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTRiMGVkNDItYzgzZC00ZjBlLWEzN2MtNGM5ZTJlNmM0MWJjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.W3UKSmW_uC7JkODmybhevwYAJSg0aH0p74ij1i-rWeM/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNWViYzYzNjYtNzllMS00NGJkLWFiMDItYjhjZjAzNjFiZjk4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.90OXN5ka7tG3zPNFfF8vpgE92oGEvGBBK0IRvvVUM_I/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzI4YzRjNzgtYzZkNi00ODc3LTg4MmUtNDExNzE5NzU3MzUzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.wwboNczzj4Eb0bpMHebM6imwWdH925DAbMLmuJmotGc/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion - Recorded.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWM0MTAyNjktNDdmMy00ZjEwLWFjNWUtNDQ0YzI4ZjY0ZTU4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.JAXJFB2ADKm4uWQZv2cI4e8oCyg73oyvG4kkYlMmkC8/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion - Recorded.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/88b55f27-ecac-46bb-8e8c-7057f5f215fa.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 02 - NCERT Discussion Notes .pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 02 - NCERT Discussion Notes .pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 02 - NCERT Discussion Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 02 - NCERT Discussion Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e3772668-5d06-4188-95d0-fb1a2c69202e.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 02 - NCERT Discussion Notes .pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 01 - NCERT Discussion Notes .pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 01 - NCERT Discussion Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 01 - NCERT Discussion Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3a655503-66eb-4c4f-9aff-0bac6891dd61.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 01 - NCERT Discussion Notes .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion Notes .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2ea9d22c-449f-4f30-a238-7ec276ab96bc.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - NCERT Discussion Notes .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8cdd56c2-ec8c-4272-a887-0ad7536ece2c.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/31678670-49c2-437b-b766-842ba582593c.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6608cc64-3de2-4e54-b9f8-fb953edcc2df.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion Notes .pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/dd59e03f-e157-4ee6-80d7-9fa35c3339c7.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स -पदार्थ-उपकरण और सरल परिपथ 01 - NCERT Discussion Notes .pdf" - skipping download"
fi
if [ ! -f "नाभिक 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "नाभिक 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/bb7f3409-5187-4353-87c5-7dc8d9f73081.pdf"
else
    echo "File exists: "नाभिक 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "नाभिक 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "नाभिक 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ba3219e6-9b55-4c16-b9e3-4e51e04d9ee5.pdf"
else
    echo "File exists: "नाभिक 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "परमाणु 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "परमाणु 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8782a9b1-dd25-4b20-bdc8-a1823b4554ad.pdf"
else
    echo "File exists: "परमाणु 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "परमाणु 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "परमाणु 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1bc7c884-0365-4c6b-bcd1-c4cbdc5eb406.pdf"
else
    echo "File exists: "परमाणु 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d23ff45d-3e40-40c0-bad4-5a4d256e9250.pdf"
else
    echo "File exists: "विकिरण तथा द्रव्य की द्वैत प्रकृति 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e942e538-b54b-494f-9066-24889fc47e32.pdf"
else
    echo "File exists: "विकिरण तथा द्रव्य की द्वैत प्रकृति 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 02 - NCERT Discussion Note.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 02 - NCERT Discussion Note.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 02 - NCERT Discussion Note.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/70d273fc-4df8-4227-8c96-94fdcfe13e0b.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 02 - NCERT Discussion Note.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c6edefb1-13ac-43a6-b7a1-e938964af57f.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/93d38b38-bb67-4561-87f9-0ac9a85b2afc.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2cd73193-7cb2-4446-abee-a5dde961e62c.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8ed37e26-4620-46cc-92e1-307a3d97c0ee.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion Notes .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d81b62b1-abed-4e91-9e24-bda52cd44a00.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 02 - NCERT Discussion Notes .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5dce26fd-2f82-499c-be70-7040dc2884c3.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/32421f40-e5ff-4f10-8733-a316fb9b47be.pdf"
else
    echo "File exists: "विद्युत धारा 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/248aec5a-954f-45e6-8ba8-eae31f4c6528.pdf"
else
    echo "File exists: "विद्युत धारा 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c95d0408-e7b2-4210-ace7-9fc2bf7f757b.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/73b70446-8d33-4f6b-9a5f-12a58f540ab2.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5472c10c-82d2-45f1-adb5-19d31e42714f.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 02 - NCERT Discussion Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5b639914-285c-4841-84e7-4d245ef0ed1d.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 01 - NCERT Discussion Notes.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Summary Lecture"
mkdir -p "Summary Lecture" && cd "Summary Lecture"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - Summary Lecture - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - Summary Lecture - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - Summary Lecture - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTZhOWJiY2MtNjhiMi00NGMzLTk5NmYtZDI5ZTNjNWJhZmE2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.F6Tgr8Oi_6f5f9SJdLJA5gtA8FvITSLeZvKaS3cf490/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - Summary Lecture - Extra Lecture - Recorded.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/8dc10a2c-3eb5-4f1e-baa2-b248e19592f9.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - Class Notes.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Revision"
mkdir -p "Revision" && cd "Revision"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "दोलन 06 - SHM मे ऊर्जा - Spring Block System का आवर्तकाल - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "दोलन 06 - SHM मे ऊर्जा - Spring Block System का आवर्तकाल - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 06 - SHM मे ऊर्जा - Spring Block System का आवर्तकाल - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTc1Yzg1NDQtZGUyNi00YjVmLWE1MDctNjRkODhjYmMyMGQ3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.BxOP97AGqexexZMbcgI4XQXRT42Aknoqq5A0jrFRQXs/hls/360/main.m3u8"
else
    echo "File exists: "दोलन 06 - SHM मे ऊर्जा - Spring Block System का आवर्तकाल - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "दोलन 05 - SHM पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "दोलन 05 - SHM पर आधारित प्रश्न - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 05 - SHM पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzIxZmIzNmMtZDk0NS00MjNiLWE4NzctZDg4ZGI5YTA3Yjg2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.pzBmXJA91oUUs6rITmmQlnxScAmYd6P5civYEVOKIws/hls/360/main.m3u8"
else
    echo "File exists: "दोलन 05 - SHM पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "दोलन 04 - SHM पर आधारित प्रश्न - SHM का अध्यारोपण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "दोलन 04 - SHM पर आधारित प्रश्न - SHM का अध्यारोपण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 04 - SHM पर आधारित प्रश्न - SHM का अध्यारोपण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzBjNGUyYzAtMDc4My00OWY0LWJiNmEtYjUyNGQ1OWE1M2U3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.C6SRZ70GoCxazl3thQ1dygMMwJpKoFAjJ3w7xOg2Ok4/hls/360/main.m3u8"
else
    echo "File exists: "दोलन 04 - SHM पर आधारित प्रश्न - SHM का अध्यारोपण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "दोलन 03 - SHM मे कलान्तर पर आधारित प्रश्न - SHM मे कण का वेग व त्वरण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "दोलन 03 - SHM मे कलान्तर पर आधारित प्रश्न - SHM मे कण का वेग व त्वरण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 03 - SHM मे कलान्तर पर आधारित प्रश्न - SHM मे कण का वेग व त्वरण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjk0NWQyODktM2NmZC00OTM5LWEyM2ItNDA1M2IzOWI3MTNlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.mEQTtr-2YSk4MB-7jsaK2v7_mL60L5OMuak7EC7t288/hls/360/main.m3u8"
else
    echo "File exists: "दोलन 03 - SHM मे कलान्तर पर आधारित प्रश्न - SHM मे कण का वेग व त्वरण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 10 - समाकलन - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 10 - समाकलन - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 10 - समाकलन - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjg5NTBhYTAtNWRlMC00NGI3LWE2ZWQtZDkzYjkwOWUwOGI4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.bJD1z-_XmeqBp6sCWZRob5eospP0LRpYVv3725Hg9hk/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 10 - समाकलन - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 09 - अवकलन - III - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 09 - अवकलन - III - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 09 - अवकलन - III - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzI1MDIyZjYtMGM5OS00MGNhLTkzM2YtY2RkMjZjMmU1ZjhiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.pAMgNEVdoZGGwFHHtaRamnc9t7fLfsy6xdT6p9r_hcE/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 09 - अवकलन - III - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 08 - अवकलन - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 08 - अवकलन - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 08 - अवकलन - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZWYzN2RhNDUtYTc3YS00ZTNiLWI5YWUtNDhkYjFlMmQ5NjM3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.p_H-JVlosnXZe9I13597m8ciQ3qi7GApu3lFqzUiFX0/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 08 - अवकलन - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 07 - अवकलन - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 07 - अवकलन - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 07 - अवकलन - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNmI1MTE0MTAtYTY0Zi00NWY5LTllMTItOTJkNjVjNTJkMDFjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.qsyq9mkw25snm_fq3joS0CMTwGJGU0G--Ib8VVSKLbY/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 07 - अवकलन - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 06 - द्विपद प्रमेय - फलन - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 06 - द्विपद प्रमेय - फलन - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 06 - द्विपद प्रमेय - फलन - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWE5NTBiMDMtOTI5NC00MWM3LTgwMjYtYjYyYjZiNWUwMWY0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.2UAnaoUKIHUq7gLooMbFdQARhwz0rIkXz19LwgUAG_I/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 06 - द्विपद प्रमेय - फलन - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 05 - लॉग के गुणधर्म - एपी और जीपी - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 05 - लॉग के गुणधर्म - एपी और जीपी - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 05 - लॉग के गुणधर्म - एपी और जीपी - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDc1MTVjZWItMWI0Yi00ZWMxLTgxMjAtNjJmOTQ3NmMxZTk5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.GUJ_ZBaYCH_yvDJViIkFJCBKNjHlzCrNY0LwI4WK-wU/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 05 - लॉग के गुणधर्म - एपी और जीपी - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 04 - निर्देशांक ज्यामिति - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 04 - निर्देशांक ज्यामिति - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 04 - निर्देशांक ज्यामिति - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTgxMmE5NWYtZWQxYy00NTQ4LThkMWQtNTE1MTcyM2U0MjY0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.tnSZC3iEzBJfyy-fAtaodClEwdiWY-lShOhozRWTlPw/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 04 - निर्देशांक ज्यामिति - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 03 - निर्देशांक ज्यामिति - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 03 - निर्देशांक ज्यामिति - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 03 - निर्देशांक ज्यामिति - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzBkNjVmMDctNDIwNi00ZjdmLWExMGUtM2ZkM2EwN2Q3ZDI3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ROAUuGqEqSLQhN8eVUXmQ1QDOAEd1SX-fsBQDpVs_so/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 03 - निर्देशांक ज्यामिति - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 02 - त्रिकोणमिति - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 02 - त्रिकोणमिति - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 02 - त्रिकोणमिति - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDhmODFkYTctYTMzNi00NDY4LThlZmMtZWIyZWVmM2RkYzNmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.f7vUDHevaMHZ6Mo0yca7eZjGRo_6Sn0ZacaM4oj7NJ0/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 02 - त्रिकोणमिति - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 01 - त्रिकोणमिति - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गणितीय उपकरण 01 - त्रिकोणमिति - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 01 - त्रिकोणमिति - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWYyZWNkOWYtZDVhNS00NTVhLTg1NWEtNDU2M2I2NDNhZjA0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.vpGmNY_13MbaC48d68t8tCCpxMG3MxI4p77cvWoB7WE/hls/360/main.m3u8"
else
    echo "File exists: "गणितीय उपकरण 01 - त्रिकोणमिति - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "दोलन 02 - SHM का समीकरण - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "दोलन 02 - SHM का समीकरण - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 02 - SHM का समीकरण - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjAzYWIwY2UtYjZjMS00YjY2LWFlM2EtOTFhODI5YjcyMzFlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.hlpJqzjuHc6XbMNrOLviwjX63kY7XtlI8vsMqu_BVt4/hls/360/main.m3u8"
else
    echo "File exists: "दोलन 02 - SHM का समीकरण - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "दोलन 01 - ऊष्मागतिकी के प्रश्न - रेफ्रिजरेटर - SHM → Introduction - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "दोलन 01 - ऊष्मागतिकी के प्रश्न - रेफ्रिजरेटर - SHM → Introduction - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 01 - ऊष्मागतिकी के प्रश्न - रेफ्रिजरेटर - SHM → Introduction - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2VjNzUzN2EtYzU1Zi00ZDQxLWJlOGMtYmI0ZjQ5M2Y4NGFjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.kWWgvnckd01wurLhpgn28xC854o8vXdRV5MtB5M10tQ/hls/360/main.m3u8"
else
    echo "File exists: "दोलन 01 - ऊष्मागतिकी के प्रश्न - रेफ्रिजरेटर - SHM → Introduction - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "उष्मागतिकी 04 - प्रश्न - ऊष्मागतिक इंजन - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "उष्मागतिकी 04 - प्रश्न - ऊष्मागतिक इंजन - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 04 - प्रश्न - ऊष्मागतिक इंजन - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDI2YWFjMzgtMzE2Zi00NTBlLTk1NTQtMTIyODRmYzM5NGU4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.PLfgCBrix8l9QHNMV_3bYLZW_2fRn1PNOzmSUcgR704/hls/360/main.m3u8"
else
    echo "File exists: "उष्मागतिकी 04 - प्रश्न - ऊष्मागतिक इंजन - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "उष्मागतिकी 03 - ऊष्मागतिकी के विभिन्न प्रक्रमो का विश्लेषण - विभिन्न प्रक्रमो पर आधारित प्रश्न  - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "उष्मागतिकी 03 - ऊष्मागतिकी के विभिन्न प्रक्रमो का विश्लेषण - विभिन्न प्रक्रमो पर आधारित प्रश्न  - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 03 - ऊष्मागतिकी के विभिन्न प्रक्रमो का विश्लेषण - विभिन्न प्रक्रमो पर आधारित प्रश्न  - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTVmYmQ5ZTQtNGE3MS00ODQ4LTllOTAtOWI1Zjk3NDhjZTI1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.XB4bo5J8wdsKKsHWzLrICivIzz55tGneYSgZ8d6bpd0/hls/360/main.m3u8"
else
    echo "File exists: "उष्मागतिकी 03 - ऊष्मागतिकी के विभिन्न प्रक्रमो का विश्लेषण - विभिन्न प्रक्रमो पर आधारित प्रश्न  - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "उष्मागतिकी 02 - विभिन्न प्रकार के ऊष्मागतिक प्रक्रम - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "उष्मागतिकी 02 - विभिन्न प्रकार के ऊष्मागतिक प्रक्रम - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 02 - विभिन्न प्रकार के ऊष्मागतिक प्रक्रम - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTM1NjAzODItZTQ5NS00NzFmLWIwZTgtMTQ4NzJkNmVkYTExIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.k0VpuZ5iZ_2oJY78FAy1sH5T3q24aN3ISNfLYmsVvhc/hls/360/main.m3u8"
else
    echo "File exists: "उष्मागतिकी 02 - विभिन्न प्रकार के ऊष्मागतिक प्रक्रम - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "उष्मागतिकी 01 - माध्य मुक्त पथ - ऊष्मागतिकी Introduction - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "उष्मागतिकी 01 - माध्य मुक्त पथ - ऊष्मागतिकी Introduction - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 01 - माध्य मुक्त पथ - ऊष्मागतिकी Introduction - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDU4ZGFmNDQtMmM0My00MWFiLTg4ZTItZThlYjY0NGY1N2Y5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.L9Q7-EEBbMQw77npXaOpUC0b0supeg8mOku-ZhT8woo/hls/360/main.m3u8"
else
    echo "File exists: "उष्मागतिकी 01 - माध्य मुक्त पथ - ऊष्मागतिकी Introduction - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गत्यात्मक सिद्धांत 03 - गैस के कारण दाब - maxwell के ऊर्जा के समवितरण का नियम - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गत्यात्मक सिद्धांत 03 - गैस के कारण दाब - maxwell के ऊर्जा के समवितरण का नियम - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गत्यात्मक सिद्धांत 03 - गैस के कारण दाब - maxwell के ऊर्जा के समवितरण का नियम - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjRmNWI5NWUtNDk4ZC00YjMwLWEzOWYtYzUwOTFiNGM4N2M3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Ac_-VRTCPGptuuZerkg2PmzK-H-38cqFt6mkyB2LX0c/hls/360/main.m3u8"
else
    echo "File exists: "गत्यात्मक सिद्धांत 03 - गैस के कारण दाब - maxwell के ऊर्जा के समवितरण का नियम - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गत्यात्मक सिद्धांत 02 - आदर्श गैस की अवधारणाये - गैस के कारण दाव - विभिन्न चाले - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गत्यात्मक सिद्धांत 02 - आदर्श गैस की अवधारणाये - गैस के कारण दाव - विभिन्न चाले - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गत्यात्मक सिद्धांत 02 - आदर्श गैस की अवधारणाये - गैस के कारण दाव - विभिन्न चाले - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTZiNGYxNDktZDg0Yi00M2Y2LTkyMDUtMzRiYTFiZDQ2NDFiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.jRu__Oqys8Vcc5fV7dg6YakdKRNE7Nn3NIzEKgTk264/hls/360/main.m3u8"
else
    echo "File exists: "गत्यात्मक सिद्धांत 02 - आदर्श गैस की अवधारणाये - गैस के कारण दाव - विभिन्न चाले - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गत्यात्मक सिद्धांत 01 - न्यूटन के शीतलन के नियम का ताक्ष‌णिक रूप - वीन का नियम - गैस - Introduction - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गत्यात्मक सिद्धांत 01 - न्यूटन के शीतलन के नियम का ताक्ष‌णिक रूप - वीन का नियम - गैस - Introduction - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गत्यात्मक सिद्धांत 01 - न्यूटन के शीतलन के नियम का ताक्ष‌णिक रूप - वीन का नियम - गैस - Introduction - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjE4YjgxNmMtYjI1Mi00YWMzLTg3NGEtNDE1Yjc2NjJhNjNjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7rO20Yk8eJJnfgPyXLkqSP68afMzsoixTcO5sXj6duc/hls/360/main.m3u8"
else
    echo "File exists: "गत्यात्मक सिद्धांत 01 - न्यूटन के शीतलन के नियम का ताक्ष‌णिक रूप - वीन का नियम - गैस - Introduction - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 07 - संवहन - विकिरण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 07 - संवहन - विकिरण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 07 - संवहन - विकिरण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiM2MzMjc2NjEtYWQwNi00YjVlLTg1M2ItMjMxNjgwYTQzYzFhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.yaivbYJoYfb9tBIWI1_mR1eRnCDe7xfug0DnKvFn5kQ/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 07 - संवहन - विकिरण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 06 - कैलोरीमापी - III - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 06 - कैलोरीमापी - III - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 06 - कैलोरीमापी - III - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjk3NWM1N2EtZTdlYS00MDI0LWJiMTQtZjg5ZTg0ZTVkMzA3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.4OSuSM3HWsTx3Lsm3UmICJYqKkFeRedt8vI3ZcqUEQg/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 06 - कैलोरीमापी - III - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 05 - कैलोरीमापी - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 05 - कैलोरीमापी - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 05 - कैलोरीमापी - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNWI3ZjNjNWYtYjg5MC00YWE2LTk0NjYtM2MwMjk1YzI5MWI3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.K0zvNrukqT61jJ12RhvppMuFOrO6eVB4I1kcQ9r-t7Y/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 05 - कैलोरीमापी - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 04 - कैलोरीमापी - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 04 - कैलोरीमापी - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 04 - कैलोरीमापी - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWJjMTY1YjMtZTljZC00MWE0LWE2NzUtYTAxOTc5YWY1YzUzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.SaPkOdo7mAlVTK_X5yvA6ypEZugztfnZ34bJY2sDIfE/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 04 - कैलोरीमापी - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 03 - तापीय प्रसार पर आधारित प्रश्न - कैलोरीमापी - Introduction - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 03 - तापीय प्रसार पर आधारित प्रश्न - कैलोरीमापी - Introduction - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 03 - तापीय प्रसार पर आधारित प्रश्न - कैलोरीमापी - Introduction - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjk4Zjg1MzItNGNkNC00NWQ0LTgwNWUtNjA4ZjI5ZDk3Zjk3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7zDfSwnlW04Viw2CxRm-Qti7e0zhai6Lz3kn1jzOVGc/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 03 - तापीय प्रसार पर आधारित प्रश्न - कैलोरीमापी - Introduction - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 02 - तापीय प्रसार - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 02 - तापीय प्रसार - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 02 - तापीय प्रसार - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzE2N2EwOTctZmY3OC00YTQyLTkyZDItMjkwODNhMmYwMDRiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.80_SPEoWGtScyJbffvMTREd-74VSAj1BFKHr-mnz1N4/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 02 - तापीय प्रसार - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 01 - श्यानता एवं पृष्ठ ऊर्जा पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 01 - श्यानता एवं पृष्ठ ऊर्जा पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 01 - श्यानता एवं पृष्ठ ऊर्जा पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzE2MGQ4NGYtNGE4MC00Y2U2LTg1NTUtYzk0ZmU5MzZkOGY2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7G6rz2pQ39ox1jV3-t1l-zYX4u9wCxy3AoxEEHtSBvY/hls/360/main.m3u8"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 01 - श्यानता एवं पृष्ठ ऊर्जा पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 10 - श्यानता - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 10 - श्यानता - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 10 - श्यानता - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjJjZjRkNTMtNDE2NC00MmU4LThjOGYtYmE2YWY0ZjBjMTNmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.o4GDf3uP5QN_StSNOkPLr1QxQ3RrHuqDplmjIOoQrmo/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 10 - श्यानता - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 09 - पृष्ठ तनाव - II - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 09 - पृष्ठ तनाव - II - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 09 - पृष्ठ तनाव - II - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2NkOWE3YzMtOTM0Ny00M2RhLTk3ZjctYzhjMjI5NmI0ODliIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.q0b79_JXpXqLbRV3IS9XAhzWbc16IkakdYGhhMUTbjQ/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 09 - पृष्ठ तनाव - II - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 08 - पृष्ठ तनाव - NO DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 08 - पृष्ठ तनाव - NO DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 08 - पृष्ठ तनाव - NO DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzMwMjRjOWQtY2YzZi00Y2Q1LWJmMWYtNjRiMGVmMjlhOGJkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.zWakqdtI9rTaMHl2AlLs2MHxRb7YHY6D7bTeilPXEEc/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 08 - पृष्ठ तनाव - NO DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 07 - बर्नौॉली की प्रमेय के अनुप्रयोग - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 07 - बर्नौॉली की प्रमेय के अनुप्रयोग - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 07 - बर्नौॉली की प्रमेय के अनुप्रयोग - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzUwMDUyZGItMTcyNi00ZWQ1LTkwOGItZDc5NzdlZDQ1MzM3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.xBEGxwdYWaIM5o1_SP8FxlYk6r_nWF_io8kh23fJN80/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 07 - बर्नौॉली की प्रमेय के अनुप्रयोग - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 06 - द्रव के घूर्णन पर आधारित प्रश्न - सत्‌ता का समीकरण - बरनौली प्रमेय - Extra Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 06 - द्रव के घूर्णन पर आधारित प्रश्न - सत्‌ता का समीकरण - बरनौली प्रमेय - Extra Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 06 - द्रव के घूर्णन पर आधारित प्रश्न - सत्‌ता का समीकरण - बरनौली प्रमेय - Extra Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTJhNDgwNjctNmQ5MC00NDZkLTgwODItMWU1MWQwMWViYzE0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.KVfKsGeb5Kj2cwYkqWG-sRUhmEMuZEKmwB97d1CcQ60/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 06 - द्रव के घूर्णन पर आधारित प्रश्न - सत्‌ता का समीकरण - बरनौली प्रमेय - Extra Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 05 - द्रव की क्षैतिज गति - द्रव का घूर्णन - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 05 - द्रव की क्षैतिज गति - द्रव का घूर्णन - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 05 - द्रव की क्षैतिज गति - द्रव का घूर्णन - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGM5MGQ5YmEtYjUyNi00MDk0LThkMDAtNmY0ZTRhZTBlMTdkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.d3uL6D0nalYNAIpNjG54ULIpTuDU-Y1e8mE8dyOKxLs/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 05 - द्रव की क्षैतिज गति - द्रव का घूर्णन - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 04 - आर्कमिडीज के सिद्धांत के अनुप्रयोग - बैरोमीटर - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 04 - आर्कमिडीज के सिद्धांत के अनुप्रयोग - बैरोमीटर - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 04 - आर्कमिडीज के सिद्धांत के अनुप्रयोग - बैरोमीटर - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYmQ0MDFiOTItYmZiYi00MGU5LTk4YzAtNWRhNmMyYzgyOTMyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.52WVAAcFXUvUliqGSZHG71sCH3VcEaKpvAOgsBfoQPQ/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 04 - आर्कमिडीज के सिद्धांत के अनुप्रयोग - बैरोमीटर - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 03 - द्रव कॉलम के कारण दाव - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 03 - द्रव कॉलम के कारण दाव - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 03 - द्रव कॉलम के कारण दाव - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNGQ3ZDJiNDgtNmQzNy00NmQwLWI5ZDItNzUwZmI3NGU2YjQzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.pwprzdN1Sl_gymabC50GtMkQiPh7J6oeU-NZQORA6tE/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 03 - द्रव कॉलम के कारण दाव - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 02 - द्रव कॉलम के कारण दाव - दाब के कारण पात्र की सतह पर बल - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 02 - द्रव कॉलम के कारण दाव - दाब के कारण पात्र की सतह पर बल - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 02 - द्रव कॉलम के कारण दाव - दाब के कारण पात्र की सतह पर बल - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTNmMzYzN2ItZTNiNC00ZDI3LWEwZjgtZjA5MjBmYzI5NDMwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.txwELg7ZKgxYY5eCIG7-PVUu9yuUlh-Ph26cdfgrw2w/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 02 - द्रव कॉलम के कारण दाव - दाब के कारण पात्र की सतह पर बल - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 01 - पदार्थो का Plastic व्यवहार - प्रत्यास्था पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 01 - पदार्थो का Plastic व्यवहार - प्रत्यास्था पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 01 - पदार्थो का Plastic व्यवहार - प्रत्यास्था पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2E1ZmFiMTYtOGI3ZC00NDYzLTg2NGYtYWY2NDQ3YzYwYTM5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.MPIhFCNze_Vb56s_RH9fQ_5cU-rpCCE8VJr9HX_e7Zo/hls/360/main.m3u8"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 01 - पदार्थो का Plastic व्यवहार - प्रत्यास्था पर आधारित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "ठोसों के यांन्त्रिक गुणधर्म 02 - प्रत्यास्थता - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "ठोसों के यांन्त्रिक गुणधर्म 02 - प्रत्यास्थता - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "ठोसों के यांन्त्रिक गुणधर्म 02 - प्रत्यास्थता - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTBhOGVlODQtODNlZC00OTRmLWIwOWQtNjRiMmUzODUxNzNhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.TlJGi5D-2pUPsykUYLswn6_5mTZgad_rE-tZYnSPOWg/hls/360/main.m3u8"
else
    echo "File exists: "ठोसों के यांन्त्रिक गुणधर्म 02 - प्रत्यास्थता - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "ठोसों के यांन्त्रिक गुणधर्म 01 - कॅपलर के नियम - प्रत्यास्थता - प्रतिबल - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "ठोसों के यांन्त्रिक गुणधर्म 01 - कॅपलर के नियम - प्रत्यास्थता - प्रतिबल - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "ठोसों के यांन्त्रिक गुणधर्म 01 - कॅपलर के नियम - प्रत्यास्थता - प्रतिबल - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTNjMjhlNGMtZDkyOS00MzVkLTk2YTQtOWU0NDc1OTRmMzY4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.J7sF-NSraYzlhBfkzftFeGhFsEr4hGtC-9Mvdp4M3a0/hls/360/main.m3u8"
else
    echo "File exists: "ठोसों के यांन्त्रिक गुणधर्म 01 - कॅपलर के नियम - प्रत्यास्थता - प्रतिबल - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 06 - उपग्रहो की गीत - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 06 - उपग्रहो की गीत - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 06 - उपग्रहो की गीत - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTBiODAyZGMtYTg4My00N2VmLWE4YjYtMWU1Y2Y1ZTc0YzBjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.A-y-DfJW7spbjnoVYcdSaestXoJLr-l3JrcojmUDoh8/hls/360/main.m3u8"
else
    echo "File exists: "गुरुत्वाकर्षण 06 - उपग्रहो की गीत - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 05 - पृथ्वी की सतह से h ऊँचाई पर स्थितिज ऊर्जा - मिश्रित सवाल - पलायन वेग - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 05 - पृथ्वी की सतह से h ऊँचाई पर स्थितिज ऊर्जा - मिश्रित सवाल - पलायन वेग - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 05 - पृथ्वी की सतह से h ऊँचाई पर स्थितिज ऊर्जा - मिश्रित सवाल - पलायन वेग - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjJmNDVhMTAtNDMwNS00MGFmLWFmYWYtYzU1OGQ2OWNjNjE3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.nmHswXM8AT25h7ZHJiqDxR497Z95aq9QmxQ3z0wq-6s/hls/360/main.m3u8"
else
    echo "File exists: "गुरुत्वाकर्षण 05 - पृथ्वी की सतह से h ऊँचाई पर स्थितिज ऊर्जा - मिश्रित सवाल - पलायन वेग - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 04 - गुरुत्वीय स्थितिज ऊर्जा - खोखले व ठोस गोले के कारण – गुरुत्वीय क्षेत्र व विभव - पृथ्वी की सतह से h ऊँचाई पर g - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 04 - गुरुत्वीय स्थितिज ऊर्जा - खोखले व ठोस गोले के कारण – गुरुत्वीय क्षेत्र व विभव - पृथ्वी की सतह से h ऊँचाई पर g - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 04 - गुरुत्वीय स्थितिज ऊर्जा - खोखले व ठोस गोले के कारण – गुरुत्वीय क्षेत्र व विभव - पृथ्वी की सतह से h ऊँचाई पर g - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiM2IzMTE3NjctNTY5NS00NWQ1LTkwNGYtYjc0YTM3MzdiZDVmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.OU17w4yTfJDUIhtIE-AhVdnOy34XlpUiOL09W2rOrSE/hls/360/main.m3u8"
else
    echo "File exists: "गुरुत्वाकर्षण 04 - गुरुत्वीय स्थितिज ऊर्जा - खोखले व ठोस गोले के कारण – गुरुत्वीय क्षेत्र व विभव - पृथ्वी की सतह से h ऊँचाई पर g - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 03 - विभिन्न प्रकार के द्रव्यमान वितरण के कारण गुरुत्वीय क्षेत्र व गुरुत्वीय विभव - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 03 - विभिन्न प्रकार के द्रव्यमान वितरण के कारण गुरुत्वीय क्षेत्र व गुरुत्वीय विभव - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 03 - विभिन्न प्रकार के द्रव्यमान वितरण के कारण गुरुत्वीय क्षेत्र व गुरुत्वीय विभव - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWE3OTM4MTQtNjJjZi00MmFlLWI4YzMtOGRhZjNhZWQ2ZWQ5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.n9CWxNVwWAmwzNl2JSYuYemZjN2B5YRPhZOSzt1e-Ns/hls/360/main.m3u8"
else
    echo "File exists: "गुरुत्वाकर्षण 03 - विभिन्न प्रकार के द्रव्यमान वितरण के कारण गुरुत्वीय क्षेत्र व गुरुत्वीय विभव - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 02 - गुरुत्वीय क्षेत्र व विभव - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 02 - गुरुत्वीय क्षेत्र व विभव - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 02 - गुरुत्वीय क्षेत्र व विभव - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODg1NjBhZmItZjIyMC00NzA5LWI4NTQtZDZmNzEzOTRmOTNkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.p8UZoD9orQe5Mi73P05ZG-QHuJW-m9dr-yQoUnqkT-Q/hls/360/main.m3u8"
else
    echo "File exists: "गुरुत्वाकर्षण 02 - गुरुत्वीय क्षेत्र व विभव - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 01 - घूर्णन गति के प्रश्न - न्यूटन के गुरुत्वाकर्षण का नियम - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 01 - घूर्णन गति के प्रश्न - न्यूटन के गुरुत्वाकर्षण का नियम - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 01 - घूर्णन गति के प्रश्न - न्यूटन के गुरुत्वाकर्षण का नियम - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmJlN2RmZWEtM2VkMy00OTY2LWJjMWEtMjI5NDI4MWJkMDViIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.c9lsgCPKQ3XPbiPnhFQpe2w98TrW8qQtXOD1ip6wu5c/hls/360/main.m3u8"
else
    echo "File exists: "गुरुत्वाकर्षण 01 - घूर्णन गति के प्रश्न - न्यूटन के गुरुत्वाकर्षण का नियम - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 12 - ताक्ष‌णिक घूर्णन बिन्दु - कोणीय आवेग - घूर्णन गति मे संघट्टय - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 12 - ताक्ष‌णिक घूर्णन बिन्दु - कोणीय आवेग - घूर्णन गति मे संघट्टय - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 12 - ताक्ष‌णिक घूर्णन बिन्दु - कोणीय आवेग - घूर्णन गति मे संघट्टय - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGEzMzIyMTEtNjUyMS00YjkxLWE4NTYtNDgxYzZjNGUwMWJlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ldvY9Y0cKR2ElLdozO3WxtmwHTvRmi0UXv9AH4wPwLU/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 12 - ताक्ष‌णिक घूर्णन बिन्दु - कोणीय आवेग - घूर्णन गति मे संघट्टय - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 11 - वेलनीय गति मे कोणीय संवेग संरक्षण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 11 - वेलनीय गति मे कोणीय संवेग संरक्षण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 11 - वेलनीय गति मे कोणीय संवेग संरक्षण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNWU3OTg2MTAtMjUyZC00M2VhLTkwNjEtYzY0ZmQxZjE0MmI2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.z9hb1H0DDKqm7EZSd9S8nonFc4OPCt06cjc1psmaKPU/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 11 - वेलनीय गति मे कोणीय संवेग संरक्षण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 10 - वेलनीय गति -Part - 02- - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 10 - वेलनीय गति -Part - 02- - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 10 - वेलनीय गति -Part - 02- - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNmMwOGRmNzctMjUwYS00YThhLWJhZTktYjEzYjc1MjE5OTBhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.olv5BCav-QdgMmVrOxbUG3ZIIpXJoTUcbu87do1pqZM/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 10 - वेलनीय गति -Part - 02- - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 09 - वेलनीय गति - NO DPP.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 09 - वेलनीय गति - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 09 - वेलनीय गति - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzU4ZjI0YmEtZjhlMS00MWZkLTk5ZDEtMWI3NjlhMjk3YTViIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.jzdciPxUGUMflBxWpUJv3cWxy8S01gJTHcMG2NPXksE/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 09 - वेलनीय गति - NO DPP.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 08 - कोणीय सम्वेग के सवाल - घूर्णन गतिज ऊर्जा - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 08 - कोणीय सम्वेग के सवाल - घूर्णन गतिज ऊर्जा - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 08 - कोणीय सम्वेग के सवाल - घूर्णन गतिज ऊर्जा - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjUxYjhiNjQtZGNlYS00YmE3LWI5ZGItMzZkYjc1OWY4M2I0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.TBJs6X_fz64Nx_z0bw46MLYEbA_r-NR3JJimrzzjEg0/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 08 - कोणीय सम्वेग के सवाल - घूर्णन गतिज ऊर्जा - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 07 - बल आघूर्ण के सवाल - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 07 - बल आघूर्ण के सवाल - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 07 - बल आघूर्ण के सवाल - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWU2NGQzZmYtMDM0OS00ZTM2LWFhMjQtMGRkMDlhMzQ5NzNlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.SADmCMTLk8uP3ZlS2mDTdbYUi5k2N2LKxSYPHECVNSg/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 07 - बल आघूर्ण के सवाल - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 06 - बल आघूर्ण के सवाल - कोणीय संवेग - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 06 - बल आघूर्ण के सवाल - कोणीय संवेग - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 06 - बल आघूर्ण के सवाल - कोणीय संवेग - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTRlNjZkNmQtMzljYi00MTdlLTg2MWItYjQ1NzNlYjg3ZGYxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ASPVt7c5mbLOvabbqFOuvVFWaTeBqJfzy_l2hS1aGz8/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 06 - बल आघूर्ण के सवाल - कोणीय संवेग - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 05 - बल आघूर्ण के सवाल - वस्तु का पलटना -Toppling- - No DPP.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 05 - बल आघूर्ण के सवाल - वस्तु का पलटना -Toppling- - No DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 05 - बल आघूर्ण के सवाल - वस्तु का पलटना -Toppling- - No DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2ZiYmU0ZmEtMzViOC00OWJkLWFhYzMtN2IyYWNjZDg1Y2NjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.JRC-7tCoix_sRlxKohlVTXNsIYbindI6BKUTcZF30Z0/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 05 - बल आघूर्ण के सवाल - वस्तु का पलटना -Toppling- - No DPP.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 04 - जड़त्व आघूर्ण के प्रश्न - बल आघूर्ण - Introduction - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 04 - जड़त्व आघूर्ण के प्रश्न - बल आघूर्ण - Introduction - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 04 - जड़त्व आघूर्ण के प्रश्न - बल आघूर्ण - Introduction - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzBlYzAzM2ItOWQxNC00MTU2LTgyODQtZGQ1M2FiM2E3OGU4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.jVf_pseIzD38rA_b9iKud9wUPspz4mQlAphCR3pYsgs/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 04 - जड़त्व आघूर्ण के प्रश्न - बल आघूर्ण - Introduction - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 03 - जड़त्व आघूर्ण - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 03 - जड़त्व आघूर्ण - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 03 - जड़त्व आघूर्ण - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTI3MzY3NDYtZGZiNy00ODM4LWJlNmQtNWY0YmYyY2ZlMzQ4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.gU1Zw0Z352twvyh7HsRSV7UHYDTh0XMI67PJrsiCq44/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 03 - जड़त्व आघूर्ण - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 02 - जड़त्व आघूर्ण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 02 - जड़त्व आघूर्ण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 02 - जड़त्व आघूर्ण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMGM4ZmRiODMtYzFiOS00NTI0LWIxMDktYjcyMTBlMDE2NWVmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.gPFuhAiaU3enrUlZ0_IfNo4VwnmQnc3PRvAPIzdc4qg/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 02 - जड़त्व आघूर्ण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "घूर्णी गति 01 - संघट्टय के सवाल - घूर्णन - Introduction - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "घूर्णी गति 01 - संघट्टय के सवाल - घूर्णन - Introduction - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 01 - संघट्टय के सवाल - घूर्णन - Introduction - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWZlM2ZmYjQtZTk2Zi00YjJjLWEzODUtODY2ODdlNjVmMjI1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.4ngFdP-xYPLOyUgicuQ-h4AfEhOIbbRTSwT-CkVgv_o/hls/360/main.m3u8"
else
    echo "File exists: "घूर्णी गति 01 - संघट्टय के सवाल - घूर्णन - Introduction - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 09 - गोली चलाने मे रेखीय संवेग सरक्षण  - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 09 - गोली चलाने मे रेखीय संवेग सरक्षण  - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 09 - गोली चलाने मे रेखीय संवेग सरक्षण  - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWZkMGY3NGQtZjBkMi00MTc3LTljYTktZWVmMjA0ZmFhMTYyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.z0QF3Ubp9CZLGjKhdoemRJM0vUFyk70e3qsnEJpB-8o/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 09 - गोली चलाने मे रेखीय संवेग सरक्षण  - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 08 - रेखीय संवेग संरक्षण पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 08 - रेखीय संवेग संरक्षण पर आधारित प्रश्न - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 08 - रेखीय संवेग संरक्षण पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmYzMTQ2MTMtOTViZS00OWM2LTk0ZDAtMjVkOTUyYjJhY2YzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Kh5zHxmAo0XWsH7yuND1bzkbp1ZGGKUCwNxbq6W8D-k/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 08 - रेखीय संवेग संरक्षण पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 07 - विभिन्न निकायो का द्रव्यमान केन्द्र - रेखीय संवेग संरक्षण की अवधारणा.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 07 - विभिन्न निकायो का द्रव्यमान केन्द्र - रेखीय संवेग संरक्षण की अवधारणा.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 07 - विभिन्न निकायो का द्रव्यमान केन्द्र - रेखीय संवेग संरक्षण की अवधारणा.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZGI0N2RmZWYtODNlYi00NTM4LThlMDYtNzgxNTU5NmRjMTg4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.wMCKWIEDY6SMJByDxjZrENMbgFvuUnqRf4ktm-ouKiU/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 07 - विभिन्न निकायो का द्रव्यमान केन्द्र - रेखीय संवेग संरक्षण की अवधारणा.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 06 - कणों के निकाय का द्रव्यमान केन्द्र - सतत द्रव्यमान वितरण का द्रव्यमान केन्द्र - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 06 - कणों के निकाय का द्रव्यमान केन्द्र - सतत द्रव्यमान वितरण का द्रव्यमान केन्द्र - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 06 - कणों के निकाय का द्रव्यमान केन्द्र - सतत द्रव्यमान वितरण का द्रव्यमान केन्द्र - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTNlZjU3Y2EtYjcxNi00MGVjLTk4MjQtNzQ0YTk1YmY4OTUwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.RHtlkfOtV9vBK2bvSmW8rI_umD9JrcTI9X6WDSwjOmA/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 06 - कणों के निकाय का द्रव्यमान केन्द्र - सतत द्रव्यमान वितरण का द्रव्यमान केन्द्र - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 05 - ऊर्ध्वाधर वृत्तीय गति - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 05 - ऊर्ध्वाधर वृत्तीय गति - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 05 - ऊर्ध्वाधर वृत्तीय गति - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDE1ODVkM2EtOGM2Mi00MjBjLTlkYjgtYWUwOTMzZDAxNTZhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Us4Ep0qGFgsPohMSfTDjAaoMbiwyZzie5nyStFauDFo/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 05 - ऊर्ध्वाधर वृत्तीय गति - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 04 - बंकित सड़‌क - ऊर्ध्वाधर वृत्तीय गति.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 04 - बंकित सड़‌क - ऊर्ध्वाधर वृत्तीय गति.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 04 - बंकित सड़‌क - ऊर्ध्वाधर वृत्तीय गति.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjU0N2E3ZjctOWU4ZC00OGQ4LTgwNmYtNGIwOGRmYzk3M2Q4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.OWvVQ1pWPtMzoImWp_8emwquMCEsiGwMkGDH8Cx-Kdk/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 04 - बंकित सड़‌क - ऊर्ध्वाधर वृत्तीय गति.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 03 - अपकेन्द्रीय बल व उसके अनु‌प्रयोग - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 03 - अपकेन्द्रीय बल व उसके अनु‌प्रयोग - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 03 - अपकेन्द्रीय बल व उसके अनु‌प्रयोग - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZWU5NzAzNzgtMzdlYy00NTc4LWJkMDUtN2IwYzlkMWVlMjRhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.dp3Abv9I3qdnqr8CHXvfsEiDAmQG_aEEVRuA15ge82o/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 03 - अपकेन्द्रीय बल व उसके अनु‌प्रयोग - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 02 - वृत्तीय गति की गतिकी पर आधरित प्रश्न - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 02 - वृत्तीय गति की गतिकी पर आधरित प्रश्न - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 02 - वृत्तीय गति की गतिकी पर आधरित प्रश्न - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDA5ZWJiYzktNmQ4Yi00YzMxLTg2OTctYzQzZjNiNGQwNDI0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.PPUNrd8IRF8Y2BPK2bUz70IMJe0v12AUw62RCNJGwcQ/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 02 - वृत्तीय गति की गतिकी पर आधरित प्रश्न - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 01 - वृत्तीय गति - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 01 - वृत्तीय गति - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 01 - वृत्तीय गति - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjVmZWU3YjgtYmIzMC00OTU3LWJjOGYtYjlmYTIwMzBhZWFhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.n3aJrCOqwZaNIYiPRRjA6dZBEb02ADuMK6lA-AhsZxM/hls/360/main.m3u8"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 01 - वृत्तीय गति - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 07 - शक्ति -Power- - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 07 - शक्ति -Power- - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 07 - शक्ति -Power- - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmIxYzg4YzctOGYwMi00YzkyLWJiMmEtZWMxMTdjODRjZDdkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ynlU2pmbiee8ZHDU7qtiDANEK3hhoWSCzbhYgBM2fLM/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 07 - शक्ति -Power- - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 06 - प्रश्न अभ्यास - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 06 - प्रश्न अभ्यास - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 06 - प्रश्न अभ्यास - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWU0NjNmZTgtNTU2Zi00ZTYzLTkzYTMtMTlmNDg1YTI3MDdhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.94R4DR_7gZO-VzC2y_hTrM5LQUVwpdvgq763SJJlLlo/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 06 - प्रश्न अभ्यास - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 05 - कार्य- ऊर्जा प्रमेय पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 05 - कार्य- ऊर्जा प्रमेय पर आधारित प्रश्न - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 05 - कार्य- ऊर्जा प्रमेय पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNmY5YzgxZGQtZWM2OS00OTlhLWI0YTAtODIzNzIxMjk1NmI5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.STdOlgVIsl_YHsmJCZMkRYe92x3QEf0mHhsRXIQ4DrI/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 05 - कार्य- ऊर्जा प्रमेय पर आधारित प्रश्न - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 04 - उच्चिष्ठ और निम्निष्ठ - साम्यावस्था के प्रकार - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 04 - उच्चिष्ठ और निम्निष्ठ - साम्यावस्था के प्रकार - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 04 - उच्चिष्ठ और निम्निष्ठ - साम्यावस्था के प्रकार - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDM2N2RjNmItMDg5ZC00ZGRjLWEwNWYtZjg3NjBmNTIwNzUyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.u2hMsMNhqnLGE1YJyniV9XtuWVeAb4tGOsUUzkPZipQ/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 04 - उच्चिष्ठ और निम्निष्ठ - साम्यावस्था के प्रकार - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 03 - कार्य पर आधारित प्रश्न - संरक्षी व असंरक्षी बल क्षेत्र - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 03 - कार्य पर आधारित प्रश्न - संरक्षी व असंरक्षी बल क्षेत्र - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 03 - कार्य पर आधारित प्रश्न - संरक्षी व असंरक्षी बल क्षेत्र - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTA5Y2E3OTYtY2U3YS00NGVjLWIzM2YtMDljOGFmMjVmYzdkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.iZ8osqWYTjqUXDoYzGHnVyGwX_KW69BaTmAjXD_-M3E/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 03 - कार्य पर आधारित प्रश्न - संरक्षी व असंरक्षी बल क्षेत्र - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 02 - विभिन्न बलो द्वारा किया गया कार्य - कार्य ऊर्जा प्रमेय - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 02 - विभिन्न बलो द्वारा किया गया कार्य - कार्य ऊर्जा प्रमेय - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 02 - विभिन्न बलो द्वारा किया गया कार्य - कार्य ऊर्जा प्रमेय - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzM3OGZkN2EtMDg5Zi00ZWU1LWI2YWItM2I1YTE1YzQyYjdlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.nEdMgIw_ANHULColFvp-PF8OX1LvCfwzStHzxq_fxnQ/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 02 - विभिन्न बलो द्वारा किया गया कार्य - कार्य ऊर्जा प्रमेय - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 01 - कार्य - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 01 - कार्य - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 01 - कार्य - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzc3N2UzMmUtNDRiYy00MWYyLWJkZmEtZTRkNjJlYjMwYWI3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.NyactPEQsgvQVwm4cA-_gwxRRp8HoLf4qS8xfAq09Vg/hls/360/main.m3u8"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 01 - कार्य - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 13 - दो Block System पर आधारित सवाल - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 13 - दो Block System पर आधारित सवाल - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 13 - दो Block System पर आधारित सवाल - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDgxOGFmZDUtYjY3Yi00MmE1LWI0MWUtZjUyN2NlOTAxYjgxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.iJ1J75gl8Sex_cLsUu5fygqAvuS67ub-eTZe63E5LDo/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 13 - दो Block System पर आधारित सवाल - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 12 - घर्षण कोण - विराम कोण - प्रश्न - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 12 - घर्षण कोण - विराम कोण - प्रश्न - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 12 - घर्षण कोण - विराम कोण - प्रश्न - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGM3MWFmOGEtZjdkNS00NDRhLTg2NTEtMDE4MmQyZmUyYmVjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7pZdHEjIlj8R-k-u3jyeJFQKmENH5AXJ5sgNEpeG6iY/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 12 - घर्षण कोण - विराम कोण - प्रश्न - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 11 - घर्षण बल - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 11 - घर्षण बल - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 11 - घर्षण बल - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTMzYzBiYzAtZGM5MC00ZGJkLThiNTctODMzMzk4Yjg3NGE0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.PisL6Kyp3fukce47L5cdpiQztQIfhv--7ihjtTh5tr4/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 11 - घर्षण बल - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 10 - मिश्रित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 10 - मिश्रित प्रश्न - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 10 - मिश्रित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTBlMTNjODctZDI4Zi00MTJiLTk2MzEtZTEyMjcwOWM0MTQ1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.9lLlsCO3_osFA179_OhjlB7d3fnBcfEufiumakgk9Js/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 10 - मिश्रित प्रश्न - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 09 - Spring का बल - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 09 - Spring का बल - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 09 - Spring का बल - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjE2MGUwZjAtNmJlMS00NThmLThiNjEtODE4NTc1ODMwOGUyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.rzBW57V0H5eHr4OYtYDa_DvZ6rMIbgwuNFSly-5aCmw/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 09 - Spring का बल - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 08 - बाधित गति - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 08 - बाधित गति - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 08 - बाधित गति - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjk1YWYwNDMtOTBhYy00NTIyLTgxMjctY2ZhY2FhMTczMGIwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.LFGLfbDHafVMc7YhHEVTLxQFVsDr6WqFImawHpkne2M/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 08 - बाधित गति - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 07 - आभासी बल - घिरनी -Pulley- - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 07 - आभासी बल - घिरनी -Pulley- - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 07 - आभासी बल - घिरनी -Pulley- - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmQ4MDUxOWItYjNkOS00NTU2LWE4MTktYzNkNmM2YjYzM2VjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.sfLpxrhqNeN1NweBcEOHTnAOrFY4cMGK34nb6dfoOc8/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 07 - आभासी बल - घिरनी -Pulley- - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 06 - तनाव बल - मिश्रित सवाल - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 06 - तनाव बल - मिश्रित सवाल - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 06 - तनाव बल - मिश्रित सवाल - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGY4M2RkYWYtNzc2MS00MTliLWJlMDQtYzkwNDU0YmZiMGQ1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.2I5zRdCjdSK2kAKwyk5Dq472FW9xsDBKyGZv02FQy7I/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 06 - तनाव बल - मिश्रित सवाल - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 05 - भार- अभिलम्ब बल- तनाव बल - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 05 - भार- अभिलम्ब बल- तनाव बल - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 05 - भार- अभिलम्ब बल- तनाव बल - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNGM2OTk0ZTEtZmFmZC00NTcyLWEyMzUtN2QyY2Q2NGFlMmY0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ch9yO-oFTCgivcLDmjAjzirkOvXZlZ9SrVdWYsFuUCA/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 05 - भार- अभिलम्ब बल- तनाव बल - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 04 - बल के प्रकार - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 04 - बल के प्रकार - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 04 - बल के प्रकार - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTVkNWZlMzQtM2Y4OS00ZjI5LWJiZGQtZWRmZmM4NGMxYTJjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.oT8irG2amQvzOu9ta5pGu73yfyivm4Ihf-bWShUQSsU/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 04 - बल के प्रकार - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 03 - आवेग व संवेग - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 03 - आवेग व संवेग - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 03 - आवेग व संवेग - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGQ5Y2Y2NDctMzI4NS00MjBkLWJlZmMtYTg1YTY4ZGY5MmJlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ScfCzttZTDcP_xgejAjORYBCLsjqZo7rsf2b7LVQ8AY/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 03 - आवेग व संवेग - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 02 - न्यूटन के गति का दूसरा नियम व इसके अनुप्रयोग - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 02 - न्यूटन के गति का दूसरा नियम व इसके अनुप्रयोग - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 02 - न्यूटन के गति का दूसरा नियम व इसके अनुप्रयोग - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZGEzYjY1N2YtOTIyNC00MjZmLWI4YTgtYTI4ZjU0YmM3NzBiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.9Veb7AE8RHdpX3U_hOVdyB6eRSheg5XXObdGLtwlEdc/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 02 - न्यूटन के गति का दूसरा नियम व इसके अनुप्रयोग - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "गति के नियम 01 - नत तल पर ऊपर से नीचे की ओर प्रक्षेप - प्रक्षेप गति में आपेक्षिक गति - बल→ Introduction - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "गति के नियम 01 - नत तल पर ऊपर से नीचे की ओर प्रक्षेप - प्रक्षेप गति में आपेक्षिक गति - बल→ Introduction - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 01 - नत तल पर ऊपर से नीचे की ओर प्रक्षेप - प्रक्षेप गति में आपेक्षिक गति - बल→ Introduction - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTUzZTg5YWUtYzYzZi00NzNjLTljYWQtNWI3ZGEzZTg2YjhjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.attA5_RPnwAdzdh8A0sJn4-ZrW8Jl4HO__FDySlNr-8/hls/360/main.m3u8"
else
    echo "File exists: "गति के नियम 01 - नत तल पर ऊपर से नीचे की ओर प्रक्षेप - प्रक्षेप गति में आपेक्षिक गति - बल→ Introduction - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 11 - प्रश्न - नत तल पर गति - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 11 - प्रश्न - नत तल पर गति - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 11 - प्रश्न - नत तल पर गति - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzk1Mjc4YTctN2M1Yi00NTcwLTkyNWUtYTg1ZDU1MzJiODYyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.bUZpqsOEHXIfnMwQCLVlaNvZQ8j0YGz5f4BIELK-OXE/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 11 - प्रश्न - नत तल पर गति - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 10 - प्रश्न - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 10 - प्रश्न - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 10 - प्रश्न - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2YwNTQxZWYtN2RmYS00ZGU3LTliMTYtYmJkZTk0MmZmMmY0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.A3smn457TpKp4258lQYX_azlccBvyGfMJpwz6jtuZOk/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 10 - प्रश्न - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 09 - परास का विश्लेषण - मीनार से प्रक्षेप - No DPP.mp4" ]; then
    echo "\nStarting download: "समतल में गति 09 - परास का विश्लेषण - मीनार से प्रक्षेप - No DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 09 - परास का विश्लेषण - मीनार से प्रक्षेप - No DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDFmZTY1OTEtNDVhNS00NmE4LTk5ZDgtNzBjN2NjNmNjZGY4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.TGg1NVV0Z9lHEUJPaYJSBAe7bTeR6Xp4jJ0-Y2sOtek/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 09 - परास का विश्लेषण - मीनार से प्रक्षेप - No DPP.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 08 - प्रक्षेप गति - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 08 - प्रक्षेप गति - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 08 - प्रक्षेप गति - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNmFkYjhiNDItOWE4Yi00MDlmLWFiM2MtYzE5MGE1ZTY5M2ZmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.rnaewv0sehIyV1sa6zRd8bi1SOlLc8VWs3lGVmJbO5U/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 08 - प्रक्षेप गति - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 07 - बारिश मे आपेक्षिक वेग - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 07 - बारिश मे आपेक्षिक वेग - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 07 - बारिश मे आपेक्षिक वेग - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWM2ZDAxNzAtYTU2OS00Mjg2LWIyZTktZDdhMTFkNGNlZjU1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.dctg4DdnwvYFYN8SKzG9vn9RMSJA0EC1JT5Efpnok94/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 07 - बारिश मे आपेक्षिक वेग - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 06 - नदी मे आपेक्षिक वेग - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 06 - नदी मे आपेक्षिक वेग - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 06 - नदी मे आपेक्षिक वेग - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzc5N2Q0NzctMzg1Ni00NWY0LTlmNzctMjNjNmE4ZjE4N2Y2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.s0mCNF6sSXLDK-JtAYVF1xHigsoi3GBjKfx1ilNhmyA/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 06 - नदी मे आपेक्षिक वेग - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 05 - एक विमीय आपेक्षिक गति - - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 05 - एक विमीय आपेक्षिक गति - - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 05 - एक विमीय आपेक्षिक गति - - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmU0N2Q2NzYtNWJiOC00Y2NlLWIyZmUtMmViMzMzNGY4OTBkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.krP4UyqQFVhgCy5H06Eh0j3hm0pWEP9XhTpWjiexT8c/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 05 - एक विमीय आपेक्षिक गति - - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 04 - पार उत्पाद - आपेक्षिक गीत - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 04 - पार उत्पाद - आपेक्षिक गीत - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 04 - पार उत्पाद - आपेक्षिक गीत - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTcxNTAxYTYtY2NjZi00YmQ1LWE0YzEtYmJmMjVkNzBjNGJiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.4JLbnkKboKszBfi47iXzHBOBHilhKR8oFJyS1JUSfHs/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 04 - पार उत्पाद - आपेक्षिक गीत - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 03 - सदिशो का योग - सदिशो का गुणनफल - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 03 - सदिशो का योग - सदिशो का गुणनफल - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 03 - सदिशो का योग - सदिशो का गुणनफल - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGQ2ZmQ1YjQtNzc1Mi00YzE3LTg4MzktZDAzOTI4YWFjZDVmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.zQvAobQLGoeaUALVbkVzUWVsWjkJBwij99ptpRkoslY/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 03 - सदिशो का योग - सदिशो का गुणनफल - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 02 - सदिश - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 02 - सदिश - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 02 - सदिश - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjBkMmNjZmItMzEwMi00Y2ViLThkNmMtYzdlZmQ0ZGQ5OGZkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Pg-jBwiHg8uYFbViNqiVBJwN4F_ez1gbvscqIL9F6P8/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 02 - सदिश - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "समतल में गति 01 - ग्राफ पर आधारित प्रश्न - सदिश - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "समतल में गति 01 - ग्राफ पर आधारित प्रश्न - सदिश - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 01 - ग्राफ पर आधारित प्रश्न - सदिश - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMGFjMGEyMGYtZGYwZC00ZTI1LWFmN2EtNDJhMTE2MjkzMmQ0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.MWKwSq74AE5E0jPAcDj97U4PTlqemUkZUANlfs5eg8c/hls/360/main.m3u8"
else
    echo "File exists: "समतल में गति 01 - ग्राफ पर आधारित प्रश्न - सदिश - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 09 - ग्राफ - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 09 - ग्राफ - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 09 - ग्राफ - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTE4MjRjMDYtYjQ5Zi00OGYxLTg3MTEtMzgwNTAxZDI1MDI2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.1yf46k_7uR0P-QZ36oML9A2z6yh123oJXdI5mNk2k6s/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 09 - ग्राफ - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 08 - गुरुत्व के अधीन गति - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 08 - गुरुत्व के अधीन गति - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 08 - गुरुत्व के अधीन गति - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTUzYTlkNGUtOGE1NS00MjcxLWI1ZTUtOTcxMzA2NWMxZmUwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.LPPAE-0e1SY-XKIxiybhB6iCr-olqnhaNZtGyrzD2eo/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 08 - गुरुत्व के अधीन गति - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 07 - गुरुत्व के अधीन गति - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 07 - गुरुत्व के अधीन गति - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 07 - गुरुत्व के अधीन गति - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDY3Zjc4ZmItYWJhNS00ZmU5LTk2ZWYtNzMxNzFmMDY5ODBhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.uarNXm7C8JeX2O9IlfC9OHbEwCs2NWZpJyHBG_L6Tcw/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 07 - गुरुत्व के अधीन गति - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 06 - गति के समी. पर आधारित प्रशन - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 06 - गति के समी. पर आधारित प्रशन - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 06 - गति के समी. पर आधारित प्रशन - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDhjMzE1MjItODI2Yi00NzljLWFlMjYtNGJjYmY5YzNkMmE0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.fn0YU6uYR3jcExrJ_TvvzyaOf0120f41B3pbFiX2xjM/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 06 - गति के समी. पर आधारित प्रशन - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 05 - असमान त्वरण से गति - गति के समीकरण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 05 - असमान त्वरण से गति - गति के समीकरण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 05 - असमान त्वरण से गति - गति के समीकरण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDE0NGUyZDQtYjQ3Zi00ZDNhLWJjYTgtZTc5YWZmYzdiN2Y5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.prYDD20PSXshdmzvTIJEPBMBingUOWgNzh5fVtngKQ8/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 05 - असमान त्वरण से गति - गति के समीकरण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 04 - असमान त्वरण से गति - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 04 - असमान त्वरण से गति - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 04 - असमान त्वरण से गति - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzRhYzIwMTktMTFmYy00OGVmLWIyM2EtNTE5ODM0ZmRiNWFmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.WTzp_D_8h-cKo6BOHhBTptaExD-LCSu4xyXoFDfOzhQ/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 04 - असमान त्वरण से गति - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 03 - वेग - चाल - त्वरण - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 03 - वेग - चाल - त्वरण - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 03 - वेग - चाल - त्वरण - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNGYzYjU4MDUtMWY0My00M2IyLTg3ZjMtNTVhMTkyNjI1Y2ExIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.HlFgij8M9yBnTJz7YkEkUf-3YJzzcGm4tVX1ddqs--k/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 03 - वेग - चाल - त्वरण - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 02 - चाल व वेग - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 02 - चाल व वेग - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 02 - चाल व वेग - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTVjZTk0ZGItYjMzYy00Zjc0LTg2MmUtMWY2MjU4MmY3NmIyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ISsfMEN1PyCqlhvf_y4lRygrFZO3HRT5NGDBJ39oiDk/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 02 - चाल व वेग - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 01 - दूरी व विस्थापन - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "सरल रेखा में गति 01 - दूरी व विस्थापन - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 01 - दूरी व विस्थापन - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTY0MWFlYmEtM2UyOC00N2VlLTk2M2ItM2IyZjA4NmM2MmQzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.oiI4f2JEO9OimGjNKTdA3qkP440sAu7sTQK-hYfTIt8/hls/360/main.m3u8"
else
    echo "File exists: "सरल रेखा में गति 01 - दूरी व विस्थापन - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 09 - Revision -इकाई व विमाये- सार्थक अंक- मापन- - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 09 - Revision -इकाई व विमाये- सार्थक अंक- मापन- - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 09 - Revision -इकाई व विमाये- सार्थक अंक- मापन- - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWI3ZDllNmYtYzExYi00ODM5LTg3YzgtYTk1YzliNTdjNTQxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.En3nzXnVlgS9b9azQrgnajofWe7hzKeKT-zMRf06L90/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 09 - Revision -इकाई व विमाये- सार्थक अंक- मापन- - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 08 - त्रुटियाँ - II - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 08 - त्रुटियाँ - II - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 08 - त्रुटियाँ - II - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTU4NmM0OGMtZmYwMi00NzU4LWIyYmUtN2U0Njk5NWNiM2I4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.53lxu79vRAbDnu5w1o-uNI9M7CTo7aFVSZPP9tafQ7Y/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 08 - त्रुटियाँ - II - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 07 - त्रुटियाँ - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 07 - त्रुटियाँ - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 07 - त्रुटियाँ - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODI5YTAxN2MtMmRjYy00YjliLWJiNTgtMzc5NjM4MGUyM2Y1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.FKHk3uMJyTIW-pCBXvZmMfxiwLPi6nAxzUjnsjNTkdM/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 07 - त्रुटियाँ - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 06 - संख्याओं का पूर्णांकन - गतिणीय क्रियाओं में सार्थक अंक - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 06 - संख्याओं का पूर्णांकन - गतिणीय क्रियाओं में सार्थक अंक - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 06 - संख्याओं का पूर्णांकन - गतिणीय क्रियाओं में सार्थक अंक - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTJkZGEwNTItYjEzMS00YmUyLTk0MzItM2Y1MjJlZmViMjk3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.QdvapCY172wIzEvte5NncuKrj0tUJDd6gPyYMnAT3gY/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 06 - संख्याओं का पूर्णांकन - गतिणीय क्रियाओं में सार्थक अंक - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 05 - सार्थक अंक - अंको का पूर्णांकन - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 05 - सार्थक अंक - अंको का पूर्णांकन - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 05 - सार्थक अंक - अंको का पूर्णांकन - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjAxZDRiMzMtMTBlOC00MDE1LTk1NTAtNjRiODU1YWUwZmIyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.8JLBLg_KHIiybM-RxNeMPJqMGqjpA6eYX6MaUr7rb-o/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 05 - सार्थक अंक - अंको का पूर्णांकन - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 04 - विमीय विश्लेषण - मापन की विभिन्न पद्धतियाँ - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 04 - विमीय विश्लेषण - मापन की विभिन्न पद्धतियाँ - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 04 - विमीय विश्लेषण - मापन की विभिन्न पद्धतियाँ - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTFhZTAzYTctNWJkZS00NDI2LTg5ODAtOTUwOWMzNDhhYmM2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.bDdS6I2jUphK0w9kPjUKSWgKzoafYOTeih99CBtxBM8/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 04 - विमीय विश्लेषण - मापन की विभिन्न पद्धतियाँ - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 03 - विमीय विश्लेषण - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 03 - विमीय विश्लेषण - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 03 - विमीय विश्लेषण - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWYwNGE1YjUtZjE1ZC00NDRhLWJhYjMtYjYxNDk4NzZhMjhiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.aT06fkYJYu5z9aoe2ptEl_njfixCyIkFUHVPaD5eK68/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 03 - विमीय विश्लेषण - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 02 - विभिन्न राशियो के विमीय सूत्र - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 02 - विभिन्न राशियो के विमीय सूत्र - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 02 - विभिन्न राशियो के विमीय सूत्र - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDgxZGM2MGQtNTMwNi00ZGIzLWJjYWEtNThlOWZmOGExMmZlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.xlg-XVRf9EV5_slYo1ZYZ4_4tfu1mVNX46pPT1nBPKk/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 02 - विभिन्न राशियो के विमीय सूत्र - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 01 - भौतिक राशियाँ - मूल राशियाँ - व्युत्पन्न राशियाँ - No DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "इकाई तथा मापन 01 - भौतिक राशियाँ - मूल राशियाँ - व्युत्पन्न राशियाँ - No DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 01 - भौतिक राशियाँ - मूल राशियाँ - व्युत्पन्न राशियाँ - No DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjk3YWU4MzUtNzJlOS00NTUwLWI2ZDEtMjVlZjU3ZGM3MWIwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7Qz_mn1i1ECnBuBciBdlQ_K7LNegZsShrt3dp78TpCY/hls/360/main.m3u8"
else
    echo "File exists: "इकाई तथा मापन 01 - भौतिक राशियाँ - मूल राशियाँ - व्युत्पन्न राशियाँ - No DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "दोलन 06 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" ]; then
    echo "\nStarting download: "दोलन 06 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 06 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7afc769d-7721-48f6-ac1c-ba2d41fbb57c.pdf"
else
    echo "File exists: "दोलन 06 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" - skipping download"
fi
if [ ! -f "दोलन 05 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" ]; then
    echo "\nStarting download: "दोलन 05 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 05 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/22ba0979-dc0c-48d0-a08d-c7f8bac2400f.pdf"
else
    echo "File exists: "दोलन 05 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" - skipping download"
fi
if [ ! -f "दोलन 04 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf" ]; then
    echo "\nStarting download: "दोलन 04 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 04 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6d460ccd-0932-4895-aa2f-4faef096677c.pdf"
else
    echo "File exists: "दोलन 04 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf" - skipping download"
fi
if [ ! -f "दोलन 03 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" ]; then
    echo "\nStarting download: "दोलन 03 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 03 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6b6255fb-b6cd-4728-929a-e566ed101b5a.pdf"
else
    echo "File exists: "दोलन 03 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 10 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 10 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 10 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/bfb80b01-8f9c-49bf-ae23-f5f83330838c.pdf"
else
    echo "File exists: "गणितीय उपकरण 10 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 09 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 09 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 09 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/4a6abb78-e2cb-4dbd-9300-8f671994798c.pdf"
else
    echo "File exists: "गणितीय उपकरण 09 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 08 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 08 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 08 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/a6e2ae8c-9399-4fe9-b249-b6185bef09d4.pdf"
else
    echo "File exists: "गणितीय उपकरण 08 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 07 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 07 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 07 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/fc5a1fc6-5ed2-42cb-9c11-7a9f0afc952d.pdf"
else
    echo "File exists: "गणितीय उपकरण 07 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 06 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 06 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 06 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/23da90ae-2844-4a71-988f-62dc4b36f348.pdf"
else
    echo "File exists: "गणितीय उपकरण 06 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 05 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 05 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 05 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/af59141c-c58c-4e10-9906-f28f03f2bbf6.pdf"
else
    echo "File exists: "गणितीय उपकरण 05 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 04 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 04 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 04 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/aaf3dfff-7b0b-4af0-90d7-3412f1501b0d.pdf"
else
    echo "File exists: "गणितीय उपकरण 04 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 03 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/45f8a96e-7e89-4d00-a924-41f39a222fb8.pdf"
else
    echo "File exists: "गणितीय उपकरण 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/d5b56aad-049f-4562-bc0c-c733d042f376.pdf"
else
    echo "File exists: "गणितीय उपकरण 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गणितीय उपकरण 01 Class Notes.pdf" ]; then
    echo "\nStarting download: "गणितीय उपकरण 01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गणितीय उपकरण 01 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/ab705b88-5abe-4413-9d12-04dca31ea97b.pdf"
else
    echo "File exists: "गणितीय उपकरण 01 Class Notes.pdf" - skipping download"
fi
if [ ! -f "दोलन 02 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf" ]; then
    echo "\nStarting download: "दोलन 02 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 02 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c9fffb83-2f13-45a1-b945-c505758408f5.pdf"
else
    echo "File exists: "दोलन 02 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf.pdf" - skipping download"
fi
if [ ! -f "दोलन 01 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" ]; then
    echo "\nStarting download: "दोलन 01 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf""
    yt-dlp --no-warnings --progress --console-title -o "दोलन 01 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f43d6f92-03b9-4cdc-aa3a-14fedd236532.pdf"
else
    echo "File exists: "दोलन 01 - Class Notes - Arjuna JEE Hindi 2025 - Physics.pdf" - skipping download"
fi
if [ ! -f "उष्मागतिकी 04 Class Notes.pdf" ]; then
    echo "\nStarting download: "उष्मागतिकी 04 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 04 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/caa5156e-1385-4052-8dfe-8b1b7f62641c.pdf"
else
    echo "File exists: "उष्मागतिकी 04 Class Notes.pdf" - skipping download"
fi
if [ ! -f "उष्मागतिकी 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "उष्मागतिकी 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 03 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/83c188e4-7b4a-459c-84b9-d43a4d3b740b.pdf"
else
    echo "File exists: "उष्मागतिकी 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "उष्मागतिकी 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "उष्मागतिकी 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ba0dd31e-6e32-473c-a45a-aa3bc38ef9dc.pdf"
else
    echo "File exists: "उष्मागतिकी 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "उष्मागतिकी 01 Class Notes.pdf" ]; then
    echo "\nStarting download: "उष्मागतिकी 01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "उष्मागतिकी 01 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b06b9b46-f52f-49c3-bab5-24036cc7f1d2.pdf"
else
    echo "File exists: "उष्मागतिकी 01 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गत्यात्मक सिद्धांत 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "गत्यात्मक सिद्धांत 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गत्यात्मक सिद्धांत 03 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f6839d54-b0ea-4ba6-95ac-70f76b49d650.pdf"
else
    echo "File exists: "गत्यात्मक सिद्धांत 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गत्यात्मक सिद्धांत 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "गत्यात्मक सिद्धांत 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गत्यात्मक सिद्धांत 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6bf31e8b-fa71-44fc-b429-e3d8c71c63cd.pdf"
else
    echo "File exists: "गत्यात्मक सिद्धांत 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गत्यात्मक सिद्धांत 01 Class Notes.pdf" ]; then
    echo "\nStarting download: "गत्यात्मक सिद्धांत 01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गत्यात्मक सिद्धांत 01 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/fbba959a-27ce-4a17-822b-60e2f9cb4672.pdf"
else
    echo "File exists: "गत्यात्मक सिद्धांत 01 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 07 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 07 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 07 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/74b78aa1-ce34-41ac-9320-c322beb6b5f9.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 07 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 06 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 06 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 06 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/785ff0c0-abdf-4226-9b74-46eddc145db4.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 06 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 05 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 05 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 05 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f5c4add6-2ffa-4b24-bade-609d246f8bd1.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 05 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 04 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 04 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 04 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/49055704-ff9b-4488-98f2-94e92ebcb4a8.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 04 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 03 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ccf0897f-595a-40ac-8707-24db21a570e4.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3898266e-6264-48f4-bceb-aa7cc2cde745.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "पदार्थ के ऊष्मीय गुण 01 Class Notes.pdf" ]; then
    echo "\nStarting download: "पदार्थ के ऊष्मीय गुण 01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "पदार्थ के ऊष्मीय गुण 01 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4d7c23fd-fdfd-46ef-8015-edb94b02db4a.pdf"
else
    echo "File exists: "पदार्थ के ऊष्मीय गुण 01 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 10 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 10 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 10 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/151e73f2-24a1-40de-872b-24cfcd8b3167.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 10 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 09 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 09 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 09 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b042cd5e-a598-4160-b159-dc6dbffc5f00.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 09 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 08 - Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 08 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 08 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3a1179fb-1db2-40d7-a63a-1f2dc48e1f64.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 08 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 07  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 07  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 07  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c0882c5c-9c2a-4569-8338-b0679e67f811.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 07  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 06 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 06 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 06 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3881515a-f6df-40c2-96f8-f0c8a830a9ad.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 06 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 05 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 05 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 05 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d1944c32-c8e5-4835-9c96-35a40d7b2dca.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 05 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 04 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 04 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 04 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8600e157-8385-4e90-acf7-6e01868860c6.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 04 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 03 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6a60386e-05aa-4a7b-95eb-8ff3bbaa3379.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/53bc05ab-12af-49de-a430-ab2f43a22206.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "द्रवों की यांत्रिक गुणधर्म 01 Class Notes.pdf" ]; then
    echo "\nStarting download: "द्रवों की यांत्रिक गुणधर्म 01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रवों की यांत्रिक गुणधर्म 01 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4afc34b3-2d8e-4158-b7f6-cd3f79931a3b.pdf"
else
    echo "File exists: "द्रवों की यांत्रिक गुणधर्म 01 Class Notes.pdf" - skipping download"
fi
if [ ! -f "ठोसों के यांन्त्रिक गुणधर्म 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "ठोसों के यांन्त्रिक गुणधर्म 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "ठोसों के यांन्त्रिक गुणधर्म 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/00ee5dc6-a60a-447c-844c-b685b98af13e.pdf"
else
    echo "File exists: "ठोसों के यांन्त्रिक गुणधर्म 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "ठोसों के यांन्त्रिक गुणधर्म  01 Class Notes.pdf" ]; then
    echo "\nStarting download: "ठोसों के यांन्त्रिक गुणधर्म  01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "ठोसों के यांन्त्रिक गुणधर्म  01 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4b3fbb03-c255-44b4-8e4d-fc32c1ad22dd.pdf"
else
    echo "File exists: "ठोसों के यांन्त्रिक गुणधर्म  01 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 06 Class Notes.pdf" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 06 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 06 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/20ee4b3f-5f06-4d3c-a151-f45ab0d18e91.pdf"
else
    echo "File exists: "गुरुत्वाकर्षण 06 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 05 Class Notes.pdf" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 05 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 05 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ac6c2807-bb2c-4336-910e-bdbdd494560b.pdf"
else
    echo "File exists: "गुरुत्वाकर्षण 05 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 04 Class Notes.pdf" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 04 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 04 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/67b75ff6-d4a0-4414-bedf-f5cc51ade769.pdf"
else
    echo "File exists: "गुरुत्वाकर्षण 04 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 03 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/da994a1f-1ac0-45ca-a839-91f3356f913d.pdf"
else
    echo "File exists: "गुरुत्वाकर्षण 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 02 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/47e8e4b1-0b93-4a86-9224-5c5026b72d50.pdf"
else
    echo "File exists: "गुरुत्वाकर्षण 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "गुरुत्वाकर्षण 01  Class Notes.pdf" ]; then
    echo "\nStarting download: "गुरुत्वाकर्षण 01  Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गुरुत्वाकर्षण 01  Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d2a68897-6a5c-4e11-8ebc-6b999b3a87ff.pdf"
else
    echo "File exists: "गुरुत्वाकर्षण 01  Class Notes.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 12 Class Notes.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 12 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 12 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e6689077-f7e1-43bd-aff6-8a5776d8917d.pdf"
else
    echo "File exists: "घूर्णी गति 12 Class Notes.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 11 Class Notes.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 11 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 11 Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0b3a214b-a007-4893-bdcd-20f8a5573bd6.pdf"
else
    echo "File exists: "घूर्णी गति 11 Class Notes.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 10 - Class Notes.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 10 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 10 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4eafaee6-2c26-4c08-bd00-0f60835fff8a.pdf"
else
    echo "File exists: "घूर्णी गति 10 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 09 - Class Notes .pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 09 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 09 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/668618ad-a86b-4ee8-bc62-e7bc31e92c1b.pdf"
else
    echo "File exists: "घूर्णी गति 09 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 08 - Class Notes.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 08 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 08 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0c66250d-d9ae-41b1-9e16-31439d1de4a7.pdf"
else
    echo "File exists: "घूर्णी गति 08 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 07 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 07 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 07 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1b68db6a-4e3a-455c-af3d-e7c3daf6891d.pdf"
else
    echo "File exists: "घूर्णी गति 07 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 06 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/bae8712d-4ba3-4c7c-91b0-a1c434287835.pdf"
else
    echo "File exists: "घूर्णी गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 05 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c59c87aa-c07a-4577-b5c9-50040f96dc56.pdf"
else
    echo "File exists: "घूर्णी गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 04 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/243d7154-1b28-49ec-b155-2b513a0ae79d.pdf"
else
    echo "File exists: "घूर्णी गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 03 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d5884154-ba6d-40dc-a97d-f95d8fc5fdc2.pdf"
else
    echo "File exists: "घूर्णी गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 02 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 02 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 02 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/21817085-0d85-4b12-9bb7-19e43dc6ef2b.pdf"
else
    echo "File exists: "घूर्णी गति 02 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "घूर्णी गति 01 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "घूर्णी गति 01 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "घूर्णी गति 01 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5754e940-a271-41eb-badb-8bc3e314c336.pdf"
else
    echo "File exists: "घूर्णी गति 01 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4405e8b4-29e3-4ee1-add8-304938e7dfb6.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/cacfced0-ba8a-4ce0-9336-ff8c6430e7cf.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0c917e8e-5c7e-4f0e-9e5d-d83f191c0bcb.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/81e1cace-86d5-4fae-bf64-69b43e446b6a.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/da5637a9-c4ef-4060-9d73-b3854a431a03.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/608a80ab-c13c-490d-9aa1-b0fd10d79828.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3d58b03d-e3a9-4ee8-8f93-b0245b2149c5.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1db53cbd-c28a-402d-9b8b-f7d1cf273080.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "द्रव्यमान केन्द्र एवं कणों का नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "द्रव्यमान केन्द्र एवं कणों का नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "द्रव्यमान केन्द्र एवं कणों का नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3a357ec5-c89d-4343-a0b5-a9d52b4daf91.pdf"
else
    echo "File exists: "द्रव्यमान केन्द्र एवं कणों का नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 07 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 07 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 07 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b49bae2d-2985-4171-ba09-101763a6b505.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 07 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 06 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 06 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 06 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/265dc7e2-a6ae-4d58-a8ce-50ab1dc9f46c.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 06 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 05 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 05 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 05 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/44f93620-0cf4-40ab-9531-31915b4bcce7.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 05 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 04 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 04 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 04 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/17ccf2b6-2f70-4399-b1d4-efd972a07a66.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 04 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 03 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 03 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 03 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d377dcb5-08fa-47d4-88f1-d3e6bc983081.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 03 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 02 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 02 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 02 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1f60e78f-3e10-48b2-9b68-e77f3085cd31.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 02 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "कार्य- ऊर्जा तथा शक्ति 01 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "कार्य- ऊर्जा तथा शक्ति 01 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "कार्य- ऊर्जा तथा शक्ति 01 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ce6b0aa0-5e69-4c48-8828-208e2d19d1d8.pdf"
else
    echo "File exists: "कार्य- ऊर्जा तथा शक्ति 01 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 13 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 13 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 13 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/26913043-96a0-4f1d-9196-a97204c4ea05.pdf"
else
    echo "File exists: "गति के नियम 13 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 12 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 12 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 12 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/bc15c91b-6c75-4091-8913-2066a256f9a1.pdf"
else
    echo "File exists: "गति के नियम 12 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 11 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 11 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 11 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2fc5f4f9-ef0d-4bb0-aa46-70281dff8911.pdf"
else
    echo "File exists: "गति के नियम 11 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 10 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 10 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 10 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d522642a-45e9-484c-b0e7-426fe6b4ce97.pdf"
else
    echo "File exists: "गति के नियम 10 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/19352e3e-34eb-4c04-b24d-f013731eeb69.pdf"
else
    echo "File exists: "गति के नियम 09 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f63793ea-07d4-4969-a9b8-db646d6b7ac1.pdf"
else
    echo "File exists: "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/33d0e0e6-177e-454c-bc4d-9c3118790cc0.pdf"
else
    echo "File exists: "गति के नियम 07 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d4d3454d-b9cb-49d9-b61c-9fdd2830fc19.pdf"
else
    echo "File exists: "गति के नियम 06 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/867f6833-6641-4a98-88c8-9405e83d1eba.pdf"
else
    echo "File exists: "गति के नियम 05 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/af9e958e-e8b4-4b76-b956-4ad17bbbf4fb.pdf"
else
    echo "File exists: "गति के नियम 04 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5717ea81-6c3d-41b2-b012-fa8ec96e76aa.pdf"
else
    echo "File exists: "गति के नियम 03 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/063b16a7-0708-4418-989e-b3a400880ce5.pdf"
else
    echo "File exists: "गति के नियम 02 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/577e8b04-2a61-4bc2-93ed-4e4bd69dba06.pdf"
else
    echo "File exists: "गति के नियम 01 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 11 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 11 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 11 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ef5d964b-bbb0-42db-84c6-20ef605af54c.pdf"
else
    echo "File exists: "समतल में गति 11 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 10 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 10 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 10 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6497956c-f2e5-448c-b5af-7d8fa983bdc6.pdf"
else
    echo "File exists: "समतल में गति 10 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 09 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 09 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 09 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d562805c-f709-4c8d-9c3d-d8454a29b020.pdf"
else
    echo "File exists: "समतल में गति 09 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f63793ea-07d4-4969-a9b8-db646d6b7ac1.pdf"
else
    echo "File exists: "गति के नियम 08 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 07 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 07 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 07 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b5f04b71-8417-4be6-b065-bd5d480bb556.pdf"
else
    echo "File exists: "समतल में गति 07 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/90ee7f8c-cd6a-42a7-8d56-72e1112c16c1.pdf"
else
    echo "File exists: "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/62efbb3e-b61e-4e5f-b744-ed4ac2e85739.pdf"
else
    echo "File exists: "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9bc18a02-745b-4668-9d55-39677373d46a.pdf"
else
    echo "File exists: "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e5fbffeb-b11d-423a-9961-ca9401bce6a1.pdf"
else
    echo "File exists: "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9fe9118f-c350-47d1-a02b-d4e1347ae7f0.pdf"
else
    echo "File exists: "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 01 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 01 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 01 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/abd77e8a-8dc5-4cb3-9c8b-ecc1ceafac64.pdf"
else
    echo "File exists: "समतल में गति 01 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 09  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "सरल रेखा में गति 09  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 09  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9689b50f-7164-46ec-98ea-8ae7167d0062.pdf"
else
    echo "File exists: "सरल रेखा में गति 09  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 08 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "सरल रेखा में गति 08 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 08 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/af61ce36-5001-46d6-a209-4499779c1150.pdf"
else
    echo "File exists: "सरल रेखा में गति 08 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 07  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "सरल रेखा में गति 07  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 07  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/dd0e64b3-ecf5-4099-9288-40963301a42f.pdf"
else
    echo "File exists: "सरल रेखा में गति 07  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/90ee7f8c-cd6a-42a7-8d56-72e1112c16c1.pdf"
else
    echo "File exists: "समतल में गति 06 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/62efbb3e-b61e-4e5f-b744-ed4ac2e85739.pdf"
else
    echo "File exists: "समतल में गति 05 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9bc18a02-745b-4668-9d55-39677373d46a.pdf"
else
    echo "File exists: "समतल में गति 04 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e5fbffeb-b11d-423a-9961-ca9401bce6a1.pdf"
else
    echo "File exists: "समतल में गति 03 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9fe9118f-c350-47d1-a02b-d4e1347ae7f0.pdf"
else
    echo "File exists: "समतल में गति 02  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "सरल रेखा में गति 01   Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "सरल रेखा में गति 01   Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "सरल रेखा में गति 01   Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8bfd0b25-0fa3-4494-87f6-6db2b0333d20.pdf"
else
    echo "File exists: "सरल रेखा में गति 01   Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 09  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 09  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 09  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8a4bc4b6-6158-4f7a-a0bf-3cd516ee964b.pdf"
else
    echo "File exists: "इकाई तथा मापन 09  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 08 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 08 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 08 Class Notes Arjuna JEE Hindi 2025.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/3065b445-94ea-4ea6-b43b-446d55107d07.pdf"
else
    echo "File exists: "इकाई तथा मापन 08 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 07 Class Notes Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 07 Class Notes Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 07 Class Notes Arjuna JEE Hindi 2025.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/4418232f-e7e2-4e1a-887c-35306d9784f7.pdf"
else
    echo "File exists: "इकाई तथा मापन 07 Class Notes Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 06  Class Notes  Arjuna JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 06  Class Notes  Arjuna JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 06  Class Notes  Arjuna JEE Hindi 2025.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/3313b42e-dc3b-4834-b315-8cc535eea791.pdf"
else
    echo "File exists: "इकाई तथा मापन 06  Class Notes  Arjuna JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 05 Class Notes.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 05 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 05 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/824a9f10-afd5-466f-b699-e9c95df8ec78.pdf"
else
    echo "File exists: "इकाई तथा मापन 05 Class Notes.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 04 Class Notes.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 04 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 04 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/419e59c1-ae31-4c73-9d73-3be18970d480.pdf"
else
    echo "File exists: "इकाई तथा मापन 04 Class Notes.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 03 Class Notes.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 03 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 03 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/f66e54f1-78a1-4e23-9909-12dfa6a660d5.pdf"
else
    echo "File exists: "इकाई तथा मापन 03 Class Notes.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 02 Class Notes.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 02 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 02 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/399d14eb-5160-4d8b-b74f-3b82688a7dcc.pdf"
else
    echo "File exists: "इकाई तथा मापन 02 Class Notes.pdf" - skipping download"
fi
if [ ! -f "इकाई तथा मापन 01 Class Notes.pdf" ]; then
    echo "\nStarting download: "इकाई तथा मापन 01 Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "इकाई तथा मापन 01 Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/c63b7e0b-e8ed-42d2-a1de-b7071b574680.pdf"
else
    echo "File exists: "इकाई तथा मापन 01 Class Notes.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 01 : मूलभूत गणित"
mkdir -p "Ch - 01 - मूलभूत गणित" && cd "Ch - 01 - मूलभूत गणित"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "मूलभूत गणित 07 -  सदिश.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 07 -  सदिश.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 07 -  सदिश.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWI0MTM1OTYtYjM3Ny00MTk2LWI2OWMtNGMxN2Y2MmFmODJmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.uyKCcH2cAphlDwhTww8OibvhHSK3HP1r0ukrAxYHnN4/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 07 -  सदिश.mp4" - skipping download"
fi
if [ ! -f "मूलभूत गणित 06 -  समाकलन.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 06 -  समाकलन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 06 -  समाकलन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzdjOTE4NzktN2UwYy00ODgzLTlmZTAtODdlNzkxY2FhMDZlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.B4tfnm8-G1jb5JTwrJH0SIYeaVAST4DLBjPNtGgimuI/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 06 -  समाकलन.mp4" - skipping download"
fi
if [ ! -f "मूलभूत गणित 05 - अवकलज के अनुप्रयोग - NO DPP.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 05 - अवकलज के अनुप्रयोग - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 05 - अवकलज के अनुप्रयोग - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjZlMTZiYzAtNjQwZS00N2IzLTkyMjUtYjE1YmQ4ZTcxMWVjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7ueGJud8IjrDjaVh1U_jvhcmEvixxeyUxg7HvWsSHuk/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 05 - अवकलज के अनुप्रयोग - NO DPP.mp4" - skipping download"
fi
if [ ! -f "मूलभूत गणित 04 - अवकलन.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 04 - अवकलन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 04 - अवकलन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTY0ZWQ0YWItYzI3Yy00MDk0LTkyZjEtZGMwN2U2MzlmMTIwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.StXWkRpz0MfhM9Y7KTIkKndxs3YvdGAb2O6iPWZGvvI/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 04 - अवकलन.mp4" - skipping download"
fi
if [ ! -f "मूलभूत गणित 03 - फलन - अवकलन - NO DPP.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 03 - फलन - अवकलन - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 03 - फलन - अवकलन - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjk2YWJjYzEtZTc0MS00ZWJjLTlkNWItNTM3NjcwMDU4MjY4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Edm7Pv0n2ePYWUOCXvQfK5n-IOl5fSkhxpbXzOQJ-aA/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 03 - फलन - अवकलन - NO DPP.mp4" - skipping download"
fi
if [ ! -f "मूलभूत गणित 02 - फलन और ग्राफ़.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 02 - फलन और ग्राफ़.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 02 - फलन और ग्राफ़.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZGQ2YTM4ZTgtOWQzMi00N2FlLWFiYjAtNDY1NmM1YTdiZWNiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ekwoAnnY5aC36mSmXYuqOFbT2D-5sppRDxVBmC2ltWg/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 02 - फलन और ग्राफ़.mp4" - skipping download"
fi
if [ ! -f "मूलभूत गणित 01 - फलन  और ग्राफ़ - निर्देशांक ज्यामिति - NO DPP.mp4" ]; then
    echo "\nStarting download: "मूलभूत गणित 01 - फलन  और ग्राफ़ - निर्देशांक ज्यामिति - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 01 - फलन  और ग्राफ़ - निर्देशांक ज्यामिति - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzAxNjM1Y2YtYjMwNy00NGUyLTlkNjMtZDY5ZjQzZDg2NGI5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.73CJlGxXPgkpAwNxhIUDi9Mpos0fcIA87T_GGSrtgZ0/hls/360/main.m3u8"
else
    echo "File exists: "मूलभूत गणित 01 - फलन  और ग्राफ़ - निर्देशांक ज्यामिति - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "मूलभूत गणित 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 07 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/01bc7f42-d7e0-41fd-85f3-509a447d9e19.pdf"
else
    echo "File exists: "मूलभूत गणित 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित 06 - Class Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 06 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 06 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/66848286-fb2c-4045-aaf3-1b1eac61aec0.pdf"
else
    echo "File exists: "मूलभूत गणित 06 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित 05 -Class Notes .pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 05 -Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 05 -Class Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/11fa62b8-3b9c-4b50-94fa-4b34af73b283.pdf"
else
    echo "File exists: "मूलभूत गणित 05 -Class Notes .pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 04 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/9f578616-3103-4441-82a4-55a42ff723e3.pdf"
else
    echo "File exists: "मूलभूत गणित 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 03 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/f4c88d08-3931-4e58-8980-7c0f87da6bb7.pdf"
else
    echo "File exists: "मूलभूत गणित 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 02 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/d444befd-6c37-4a0d-a914-10269fffc4c4.pdf"
else
    echo "File exists: "मूलभूत गणित 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित 01 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/0078ec0b-4915-48de-896b-525c966f7830.pdf"
else
    echo "File exists: "मूलभूत गणित 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "मूलभूत गणित - DPP 04 Solution Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 04 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 04 Solution Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/ffc45d26-7dab-4314-b871-978cee6c9717.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 04 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 04 -Of Lec 07.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 04 -Of Lec 07.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 04 -Of Lec 07.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/635b001d-8f36-450e-b93b-a39d156b8887.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 04 -Of Lec 07.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 03 Solution Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 03 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 03 Solution Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/5127e93e-8d21-4cab-bb36-8a6b7b574b67.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 03 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 02 Solution Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 02 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 02 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/22943e7d-f350-47b0-b1f5-d2ea97081ec6.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 02 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 03 -Of Lec. 06.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 03 -Of Lec. 06.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 03 -Of Lec. 06.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/6880b87e-ed8f-482c-af92-2b35e7bb8911.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 03 -Of Lec. 06.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 01 Solution Notes.pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 01 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 01 Solution Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/420d704a-d525-4bb8-87c3-1a2e0812d048.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 01 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 02 -Of Lec. 04- .pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 02 -Of Lec. 04- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 02 -Of Lec. 04- .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/8da27d2b-11d3-4d29-90fc-cbf25cf69a00.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 02 -Of Lec. 04- .pdf" - skipping download"
fi
if [ ! -f "मूलभूत गणित - DPP 01 -Of Lec. 02- .pdf" ]; then
    echo "\nStarting download: "मूलभूत गणित - DPP 01 -Of Lec. 02- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "मूलभूत गणित - DPP 01 -Of Lec. 02- .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/217cf0be-6a43-4e99-b339-640b4ef9aaa5.pdf"
else
    echo "File exists: "मूलभूत गणित - DPP 01 -Of Lec. 02- .pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 02 : वैद्युत आवेश तथा क्षेत्र"
mkdir -p "Ch - 02 - वैद्युत आवेश तथा क्षेत्र" && cd "Ch - 02 - वैद्युत आवेश तथा क्षेत्र"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 16 - विद्युत द्विध्रुव.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 16 - विद्युत द्विध्रुव.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 16 - विद्युत द्विध्रुव.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzIyOGY4ODAtMTBmMy00ZjMwLTgxOGUtOWQwYjIxNDc4ZmM1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.E1J-Bizyz-MXei7iJfVdcF89jUB0U-gZ8BBAOLm87Xc/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 16 - विद्युत द्विध्रुव.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 15 - अनंत लम्बाई की चादर - प्लेट - विद्युत द्विध्रुव.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 15 - अनंत लम्बाई की चादर - प्लेट - विद्युत द्विध्रुव.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 15 - अनंत लम्बाई की चादर - प्लेट - विद्युत द्विध्रुव.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDVmMGQxYTYtMzRlNS00NzFhLThmMjEtMWRmYWJkM2U4NGU0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.3bqY-raF4h4uQrofeovd9NRxrYsBIpKt7ept2GxOVos/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 15 - अनंत लम्बाई की चादर - प्लेट - विद्युत द्विध्रुव.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 14 - गॉस के नियम के अनुप्रयोग -Part - 03.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 14 - गॉस के नियम के अनुप्रयोग -Part - 03.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 14 - गॉस के नियम के अनुप्रयोग -Part - 03.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMGQwYjk3Y2UtNWIxMS00MzdmLTg4ODYtYzQ2ODlmNjgzZmYxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.5BW0R09jKhC80A00DhaqJ2DdHhI89EXh4mR14gOQoS0/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 14 - गॉस के नियम के अनुप्रयोग -Part - 03.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 13 - गॉस के नियम के अनुप्रयोग -Part - 02- - NO DPP.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 13 - गॉस के नियम के अनुप्रयोग -Part - 02- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 13 - गॉस के नियम के अनुप्रयोग -Part - 02- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTk4MWQ3OTEtMTRhOS00OTQwLThmZDQtZjQ5MTUxNWU1OTc3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.v1U00gZPuvC4FQsBRhRWVOddqyJv09UHVhzQF5ciVC4/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 13 - गॉस के नियम के अनुप्रयोग -Part - 02- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 12 - गॉस के नियम के अनुप्रयोग -  NO DPP.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 12 - गॉस के नियम के अनुप्रयोग -  NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 12 - गॉस के नियम के अनुप्रयोग -  NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiM2QwY2RhYzAtOGFhZi00Y2NjLTlhMWItNmRlM2YwZmE3M2MwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.g3r3aSMF_rhHwrg3rMw-DLTU5JWzyqeN7apkFgHC4Uo/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 12 - गॉस के नियम के अनुप्रयोग -  NO DPP.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 11 - वलय और चाप के कारण विद्युत क्षेत्र -Part - 02.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 11 - वलय और चाप के कारण विद्युत क्षेत्र -Part - 02.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 11 - वलय और चाप के कारण विद्युत क्षेत्र -Part - 02.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWMxMjY1OTktNTJmNS00ODVhLWEwZTQtMGNiYmQ1ZDc0MDBiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.RmfIjXC7_A45aGHb9pIjUQkMEd5rJhG6gLPhUgKKeaw/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 11 - वलय और चाप के कारण विद्युत क्षेत्र -Part - 02.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 10 - वलय और चाप के कारण विद्युत क्षेत्र - NO DPP.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 10 - वलय और चाप के कारण विद्युत क्षेत्र - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 10 - वलय और चाप के कारण विद्युत क्षेत्र - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZmY1NGJmNGUtMGQ1Ny00MzM2LWEwYTItODViMWQ2MWFkOGY2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.IkePssc56X-EvRU6_skFkBsRhn16Ll1L67zaw18yxn8/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 10 - वलय और चाप के कारण विद्युत क्षेत्र - NO DPP.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 09 - विद्युत बल रेखाएँ - रेखीय आवेश वितरण के कारण E.F.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 09 - विद्युत बल रेखाएँ - रेखीय आवेश वितरण के कारण E.F.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 09 - विद्युत बल रेखाएँ - रेखीय आवेश वितरण के कारण E.F.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2Y5NDNiMmUtNjdlNC00ZDM1LWI4ZDctMTczOTg1ZmI5NDQ2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.WIfuRjg1Knped3nYgH54lpfdAro_FVYXuqxlHxP7U8M/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 09 - विद्युत बल रेखाएँ - रेखीय आवेश वितरण के कारण E.F.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 08 - आवेश वितरण के कारण विद्युत क्षेत्र - विद्युत बल रेखाएँ - NO DPP - Rescheduled @07-50 PM.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 08 - आवेश वितरण के कारण विद्युत क्षेत्र - विद्युत बल रेखाएँ - NO DPP - Rescheduled @07-50 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 08 - आवेश वितरण के कारण विद्युत क्षेत्र - विद्युत बल रेखाएँ - NO DPP - Rescheduled @07-50 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTU0MDRlNmYtMjFmYS00OTQ0LWIxYTItNTMzZjM1MWY1MmQ5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.lbGWDaVvPEdN-32bzssmzHhcKkMG8M_d8DZ7X7q3bwI/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 08 - आवेश वितरण के कारण विद्युत क्षेत्र - विद्युत बल रेखाएँ - NO DPP - Rescheduled @07-50 PM.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 07 - विद्युत क्षेत्र में आवेशित कण की गति - बिंदु आवेश के कारण विद्युत क्षेत्र - NO DPP.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 07 - विद्युत क्षेत्र में आवेशित कण की गति - बिंदु आवेश के कारण विद्युत क्षेत्र - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 07 - विद्युत क्षेत्र में आवेशित कण की गति - बिंदु आवेश के कारण विद्युत क्षेत्र - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDQyMjY4YWUtNmQ2Yy00OTdkLWFlZjktYjBiZmE5YzhlNGVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.B-NL-k_SrL4EX9EXHNcjF9jtcdDe5YMkIP9uyWb49vY/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 07 - विद्युत क्षेत्र में आवेशित कण की गति - बिंदु आवेश के कारण विद्युत क्षेत्र - NO DPP.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 06 - कूलॉम के नियम के अनुप्रयोग - विद्युत क्षेत्र.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 06 - कूलॉम के नियम के अनुप्रयोग - विद्युत क्षेत्र.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 06 - कूलॉम के नियम के अनुप्रयोग - विद्युत क्षेत्र.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjg1ZDcxZmQtNzcyNS00ZTRjLWFlNDAtZTYxZmVhYWIyNGRjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.-SqGVEf2Sk1DCVQR8fk392umJivecAZRihQUvoXqHQM/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 06 - कूलॉम के नियम के अनुप्रयोग - विद्युत क्षेत्र.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 05 - कूलॉम के नियम के अनुप्रयोग -Part 02- - Reschedule 05-55 PM.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 05 - कूलॉम के नियम के अनुप्रयोग -Part 02- - Reschedule 05-55 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 05 - कूलॉम के नियम के अनुप्रयोग -Part 02- - Reschedule 05-55 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjRkYjZhNTItNmMyZC00NTEzLWIzNDYtMzRjMDIxMGVjMjA3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.trcpkS6GMl9trkBF_Jri5JR2TsykjCx1bLULrg2EsOc/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 05 - कूलॉम के नियम के अनुप्रयोग -Part 02- - Reschedule 05-55 PM.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 04 - कूलॉम के  नियम के अनुप्रयोग.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 04 - कूलॉम के  नियम के अनुप्रयोग.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 04 - कूलॉम के  नियम के अनुप्रयोग.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGUwNjVjOTQtMTNhYy00ZjVhLThkY2UtMjdhODMxZDJlNTE0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.TGbG8v_RbG-IGN0woZEgmDFDzbJe1oJOY2qUN1X0BRY/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 04 - कूलॉम के  नियम के अनुप्रयोग.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 03 - कूलॉम का नियम व उसके अनुप्रयोग  - NO DPP.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 03 - कूलॉम का नियम व उसके अनुप्रयोग  - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 03 - कूलॉम का नियम व उसके अनुप्रयोग  - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODk2NmViZWUtZDk0NC00YWQxLWE2ZjgtNTFiNzUyNWIzMmEwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.rGxhE_CfDQnRZ0W7G3O4CssGHLlUe8UJKf0PjXZBLXI/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 03 - कूलॉम का नियम व उसके अनुप्रयोग  - NO DPP.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 02 - आवेश तथा  आवेशो  के गुणधर्म.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 02 - आवेश तथा  आवेशो  के गुणधर्म.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 02 - आवेश तथा  आवेशो  के गुणधर्म.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTEyMTMzYTktZTdhZC00ODMzLTgwNjItMWVhZDczNzJjZThlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.4rpTsO3jP0_nencSW-T2sM9JyjvkwxwASWBh9eI2YEQ/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 02 - आवेश तथा  आवेशो  के गुणधर्म.mp4" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 01 - सदिशो का  गुणनफल - आवेश व आवेश के गुणधर्म - NO DPP.mp4" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 01 - सदिशो का  गुणनफल - आवेश व आवेश के गुणधर्म - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 01 - सदिशो का  गुणनफल - आवेश व आवेश के गुणधर्म - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjI4YjBjNWYtNjg0OS00NzA4LTliODgtODMxNjg5MmY2NWI1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.JviosC9eFTiH9PZl2cMWo4-_gPrfgfYN7lFANM4eDo8/hls/360/main.m3u8"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 01 - सदिशो का  गुणनफल - आवेश व आवेश के गुणधर्म - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 16 - Class Notes .pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 16 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 16 - Class Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/403769dd-2aa0-4085-bc09-7ef4aee52d24.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 16 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 15 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 15 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 15 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/af3db067-e66a-44a9-8443-dd976658331e.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 15 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 14 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 14 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 14 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/889dbcc7-09ff-4ced-bd68-3d26ac616ef3.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 14 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 13 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 13 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 13 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/b4999aa3-6122-45c1-9ea9-b5ee5d0a6f90.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 13 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 12 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 12 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 12 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/4cac75fa-1c3b-49a2-b442-903c7e39d2b4.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 12 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 11 - Class Notes .pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 11 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 11 - Class Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/f641884e-f79b-4888-9cf8-47219f6a2bd6.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 11 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 10 _ Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 10 _ Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 10 _ Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/b528611d-6563-4ae9-b211-10581e8f5e11.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 10 _ Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 09 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 09 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 09 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/d25d0f79-4bc9-4dfa-b8d9-f40ead9c8906.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 09 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 08 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 08 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 08 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/2b16d36f-1567-4ba2-b319-0ea66b827a3d.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 08 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 07 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/a0b9e76c-5e47-4570-8176-9ad57340a0db.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 06 - Class Notes .pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 06 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 06 - Class Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/2ab08f9c-0676-45e8-ad07-fc04ba662595.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 06 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 05  Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 05  Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 05  Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/1ea2497f-0387-490a-9679-7575a34f175b.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 05  Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 04 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/cc13a786-e75d-4f05-94e3-533be3df1fee.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 03 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/56870556-d08a-4c08-bfa3-d35627bb3370.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 02 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/f2d93048-8238-43da-a8b0-5b35c8a4e104.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र 01 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/bed0ab36-c55d-43c1-a5fd-e55664b8331f.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 10 -Extra DPP- .pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 10 -Extra DPP- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 10 -Extra DPP- .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/2bfa2f04-917c-47d3-9c7c-6b9c58d808c6.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 10 -Extra DPP- .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 09 -Of Lec 16.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 09 -Of Lec 16.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 09 -Of Lec 16.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/3762c2f1-7ae8-4d4b-9d58-19e90f9e3e2f.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 09 -Of Lec 16.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 08 -Of Lec 15- .pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 08 -Of Lec 15- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 08 -Of Lec 15- .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/56e6d756-b233-4968-a183-5c9f1fc2d79e.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 08 -Of Lec 15- .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 07 -Of Lec 14.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 07 -Of Lec 14.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 07 -Of Lec 14.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/b89eae81-7600-424a-96df-33e5344c4956.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 07 -Of Lec 14.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 04 Solution Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 04 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 04 Solution Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/cf68daac-be9f-419b-a896-ebcbfcbbbf3f.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 04 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 06 -Of Lec 11.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 06 -Of Lec 11.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 06 -Of Lec 11.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/5b18dc00-5fa6-4445-9b83-b4869660ddac.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 06 -Of Lec 11.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 03 Solution Notes.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 03 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 03 Solution Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/7e3fd2b1-e41c-450b-baef-cb5454162d11.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 03 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 05 -Of Lec 09.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 05 -Of Lec 09.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 05 -Of Lec 09.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/d4be58d0-2f69-4c48-8fd3-8dea5d79db5c.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 05 -Of Lec 09.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 02 Solution Notes .pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 02 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 02 Solution Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/d60bf08f-c5e2-4f0c-94df-1afd6c71a4c2.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 02 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 04 -Of Lec 06.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 04 -Of Lec 06.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 04 -Of Lec 06.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/0de3f84e-4dc3-4aff-ac9d-fe08e7d160a9.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 04 -Of Lec 06.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र  DPP 03 -Of Lec 05.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र  DPP 03 -Of Lec 05.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र  DPP 03 -Of Lec 05.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/bf09ac7d-bff8-46f1-8b75-25168cda4e53.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र  DPP 03 -Of Lec 05.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 02 -Of Lec 04.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 02 -Of Lec 04.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 02 -Of Lec 04.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/4b95d262-4bd1-43c2-be79-f513f4020e33.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 02 -Of Lec 04.pdf" - skipping download"
fi
if [ ! -f "वैद्युत आवेश तथा क्षेत्र - DPP 01-Of Lec 02.pdf" ]; then
    echo "\nStarting download: "वैद्युत आवेश तथा क्षेत्र - DPP 01-Of Lec 02.pdf""
    yt-dlp --no-warnings --progress --console-title -o "वैद्युत आवेश तथा क्षेत्र - DPP 01-Of Lec 02.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/2f87d04a-74ca-413d-b3ec-c7e3cc2b3730.pdf"
else
    echo "File exists: "वैद्युत आवेश तथा क्षेत्र - DPP 01-Of Lec 02.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 03 : स्थिर विद्युत विभव तथा धारिता"
mkdir -p "Ch - 03 - स्थिर विद्युत विभव तथा धारिता" && cd "Ch - 03 - स्थिर विद्युत विभव तथा धारिता"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 18 - मिश्रित प्रश्न - NO DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 18 - मिश्रित प्रश्न - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 18 - मिश्रित प्रश्न - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZmYwZmQ5NjItNDE2YS00NTIxLWFmMDQtNjBkZjc5YTk2NjM2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.qC30GpgEyJlbRVuZ3TDuZFpRWxXjsotkRqovhKIG49Y/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 18 - मिश्रित प्रश्न - NO DPP.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 17 - गोलीय संधारित्र.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 17 - गोलीय संधारित्र.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 17 - गोलीय संधारित्र.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzFkZmUxMGMtMTViNC00ZDAxLWFkZmMtZjE1MDIzMmY5OTk2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.FdqhPl3ubUclD-u3hyI0cT6zDArsykbPUgmLT7Ix7A0/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 17 - गोलीय संधारित्र.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 16 - संधारित्र की प्लेटों के बीच पैरावैद्युत पट्टिका.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 16 - संधारित्र की प्लेटों के बीच पैरावैद्युत पट्टिका.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 16 - संधारित्र की प्लेटों के बीच पैरावैद्युत पट्टिका.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOWEwMGE0ZjMtYmY4MC00YmMxLTg4YjQtZTkzYWFjN2I5MTJiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.vQulAaBILPE8vvFtH7NmAH0XnXwRR2_DMYku20cm5H4/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 16 - संधारित्र की प्लेटों के बीच पैरावैद्युत पट्टिका.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 15 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता -Part -02.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 15 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता -Part -02.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 15 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता -Part -02.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWQ2Zjk1MmMtZWQ2ZS00OTlhLThkODItODk5ZGIxNWM4MjI0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.nUDOrQNTElo1sI-7cV2nRhJiGpOMKw8lwfPlC7rulPw/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 15 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता -Part -02.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 14 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता - No DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 14 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता - No DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 14 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता - No DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWJmYzg5ZGQtZDA0Ny00NDgzLWE1NTYtZjgyYjc3ZmQ0NTc4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.1az9nZ7-qrIvsliXVBi9nNuZDT66kSPeJlg_gad0nWI/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 14 - विभिन्न संधारित्र परिपथो की समतुल्य धारिता - No DPP.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 13 - संधारित्रो का श्रेणी व समांतर संयोजन.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 13 - संधारित्रो का श्रेणी व समांतर संयोजन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 13 - संधारित्रो का श्रेणी व समांतर संयोजन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzAwM2NhNGUtMzBhNi00MmJiLWE3ODUtNjk1YTQ0MDkzYTI0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.f1bWhNMgrhgNBWfM5ahaXWP5ITjAMPaIQ-VsaSkbnTI/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 13 - संधारित्रो का श्रेणी व समांतर संयोजन.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 12 - ऊष्मा हानि - किरचॉफ के नियम  - NO DPP - Rescheduled @07-35 PM.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 12 - ऊष्मा हानि - किरचॉफ के नियम  - NO DPP - Rescheduled @07-35 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 12 - ऊष्मा हानि - किरचॉफ के नियम  - NO DPP - Rescheduled @07-35 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODFkM2RkZTUtNWNiYi00ZTI3LWExYTctNDVkZTg5OTk2MWJkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.T6moLAQpuH-icnb-lyPNZ2JvrDY4ygDqPebLVaGVn8k/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 12 - ऊष्मा हानि - किरचॉफ के नियम  - NO DPP - Rescheduled @07-35 PM.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 11 - समान्तर प्लेट संधारित्र.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 11 - समान्तर प्लेट संधारित्र.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 11 - समान्तर प्लेट संधारित्र.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTE4NzA0ZDctZDQ4Zi00ZmU2LTkxY2ItOTdlZDc1YzhjMmMwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7A9lw8aZKNdtggX9-wlcg7GJ0W_qHfI1fLHOMOozWAM/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 11 - समान्तर प्लेट संधारित्र.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 10 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न -Part - 02 - - NO DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 10 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न -Part - 02 - - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 10 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न -Part - 02 - - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzFlM2MzMjMtNzQ3ZC00NTg5LWJlOTEtNTRmZTRjNTZhMzk1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.vn8c8gc8kQVu7Vig9A_o1j15F-RAojmICNCk-iRtOjY/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 10 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न -Part - 02 - - NO DPP.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 09 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न - NO DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 09 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 09 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzBlOTQ5YTAtNWI4Yi00NThiLWE5MmQtY2ZjMmU5YTU2ZDhmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.BTqKusizSKHKKwN-RTzNIyH8girIw9wQtlgy7kzjug0/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 09 - विद्युत क्षेत्र व विद्युत विभव पर आधारित प्रश्न - NO DPP.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 08 - स्थिर विद्युत निकायो की स्थितिज ऊर्जा.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 08 - स्थिर विद्युत निकायो की स्थितिज ऊर्जा.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 08 - स्थिर विद्युत निकायो की स्थितिज ऊर्जा.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjk4YzgxNDctYWYzMi00OGJlLWI0NTctYzNlOGYzMWFmZjliIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.p_kXo-ZCqWO8EixejcN0WMyZLxO3VPtYL5M5b3wpPp8/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 08 - स्थिर विद्युत निकायो की स्थितिज ऊर्जा.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 07 - विभव पर आधारित प्रश्न - Rescheduled @ 07-35 PM.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 07 - विभव पर आधारित प्रश्न - Rescheduled @ 07-35 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 07 - विभव पर आधारित प्रश्न - Rescheduled @ 07-35 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDE3NjQ2NjYtMTBkOS00Yjk4LTlhMWEtNDE3NjQ0ZWY0N2JjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.a56KVzEu-1WxvMvcf53IlbMiiS7YumTHv_JKF3INeok/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 07 - विभव पर आधारित प्रश्न - Rescheduled @ 07-35 PM.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 06 - द्विध्रुव के कारण विभव - दो आवेशित चालक वस्तुओं को जोड़ेंगे - प्रश्न.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 06 - द्विध्रुव के कारण विभव - दो आवेशित चालक वस्तुओं को जोड़ेंगे - प्रश्न.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 06 - द्विध्रुव के कारण विभव - दो आवेशित चालक वस्तुओं को जोड़ेंगे - प्रश्न.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzJmNGZkYWMtNzhlNi00ZDg5LTlmZjItNTRmZDJkMDU4MmVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.cAyVd5e5iAB-c0EZh59EnEVCMjGtvIdIs1Sc3GEbsB4/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 06 - द्विध्रुव के कारण विभव - दो आवेशित चालक वस्तुओं को जोड़ेंगे - प्रश्न.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 05 - विभाव तथा विभवान्तर -Part -03- - NO DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 05 - विभाव तथा विभवान्तर -Part -03- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 05 - विभाव तथा विभवान्तर -Part -03- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZWJmOWE1ZGYtZmNhYi00YzYwLTgxYzEtOTU1MmY2OTAzNjUwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.kYKXAZwn_7QxGeLSOnsqbm6f3undiYBnoP3E6CxfIl4/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 05 - विभाव तथा विभवान्तर -Part -03- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 04 - विभिन्न प्रकार के आवेश वितरण के कारण विभव.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 04 - विभिन्न प्रकार के आवेश वितरण के कारण विभव.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 04 - विभिन्न प्रकार के आवेश वितरण के कारण विभव.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZWVkZmY4NGUtOTQxYi00NjBjLTlmZjItZTJkZDk3ZDM2ZmNjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.cD00AkBX8-Lz2s3ysPKu_JgD-4lZP7OxHRJxSOGdgAQ/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 04 - विभिन्न प्रकार के आवेश वितरण के कारण विभव.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 03 -  विभाव तथा विभवान्तर -Part - 02- - NO DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 03 -  विभाव तथा विभवान्तर -Part - 02- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 03 -  विभाव तथा विभवान्तर -Part - 02- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmI5YzU0ZjAtZDg3Mi00MTY1LTg0NzItNTY3OGI5MzRlZWFhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.IPjOlnxf169MPYCJx6FrgBhy-fWXa8bGfNYkvrGjfOM/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 03 -  विभाव तथा विभवान्तर -Part - 02- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 02 - विभाव तथा विभवान्तर - NO DPP - Rescheduled @07-35 PM.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 02 - विभाव तथा विभवान्तर - NO DPP - Rescheduled @07-35 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 02 - विभाव तथा विभवान्तर - NO DPP - Rescheduled @07-35 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTI1ZTZkZjMtMGFjZS00ZjliLWFlYjctMDg1ZjA1YzExMWNlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.SL6arVKhCnoS2AmPJJwou0sG7ro-MVcpz3mdwsdBtN0/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 02 - विभाव तथा विभवान्तर - NO DPP - Rescheduled @07-35 PM.mp4" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 01 - विद्युत द्विध्रुव - NO DPP.mp4" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 01 - विद्युत द्विध्रुव - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 01 - विद्युत द्विध्रुव - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiM2YxNjc2OWQtODE5Mi00Y2VlLTkzN2MtOWQ4YzE1MzgwYTYzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.bIK_5uCK1YGEVAzkgK2LFuk3YkTxBK_LPwRiH-IRcL4/hls/360/main.m3u8"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 01 - विद्युत द्विध्रुव - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 18 - Class Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 18 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 18 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/954c562b-b163-4fbf-895e-dd5df139076b.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 18 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 17 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 17 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 17 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/850ea640-df6a-4240-9b41-44422e5f961f.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 17 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 16 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 16 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 16 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a816962c-6c80-47b2-9c53-93116a0a2906.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 16 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 15 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 15 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 15 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2aa46ea2-8e45-4d31-8509-c232d868cc31.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 15 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 14  Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 14  Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 14  Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8385bdec-2d25-4138-8c2d-87f37cb9eba1.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 14  Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 13 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 13 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 13 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/25ae122e-1065-4e18-bdc0-a3aea9628e56.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 13 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 12 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 12 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 12 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b101bcbc-70a2-482c-9850-7b170fdf9118.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 12 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 11 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 11 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 11 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4b44e33f-cc4c-4445-b522-0d3e114c40a2.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 11 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 10 - Class Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 10 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 10 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a5e2110b-40b5-4f09-8901-8316c414c98d.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 10 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 09 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 09 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 09 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/0259c93d-5b33-4647-8c11-f8048b73c962.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 09 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 08 - Class Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 08 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 08 - Class Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/d7798292-cd11-44a2-9b5e-a4b30ada7fd4.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 08 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 07 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/cae36c33-d018-4be2-aaf1-6f47435e1082.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 06 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 06 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 06 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/962625e5-8b96-4f61-b331-f9d624014beb.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 06 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 05 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 05 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 05 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/487efffa-df04-4577-b6ff-d9c4b0e20612.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 05 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 04 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/79af3a5a-160f-4c4a-b450-12285ef6e745.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 03 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/cad80e5e-1a77-4707-9c70-e001e62b6212.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 02 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/11292663-b24d-4cc9-9ef3-299bdf88f255.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता 01 - Class Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/ef546ca1-bb28-4a7d-a39e-8ced72316ff3.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 09 Solution Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 09 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 09 Solution Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b61d2761-a250-4727-8d73-b570569e9a49.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 09 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 08 Solution Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 08 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 08 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ce1f4209-4bba-4f92-96a8-3a7170e0eb19.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 08 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 07 Solution Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 07 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 07 Solution Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/37178705-18f0-484b-8808-015a47d6307a.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 07 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 09 -Of Lec 17- .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 09 -Of Lec 17- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 09 -Of Lec 17- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7891d59c-0078-4eb7-a11f-cb69168a4518.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 09 -Of Lec 17- .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 08 -Of Lec 16.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 08 -Of Lec 16.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 08 -Of Lec 16.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/905d8cf6-aaa1-4c0d-a73f-932768c05797.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 08 -Of Lec 16.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 06 Solution Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 06 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 06 Solution Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/dbf11674-b622-44b6-ad55-6338ad58dfdd.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 06 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 07 -Of Lec 15.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 07 -Of Lec 15.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 07 -Of Lec 15.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/872893ee-d6eb-404c-a333-e5db82410a7a.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 07 -Of Lec 15.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 06 -Of Lec 13.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 06 -Of Lec 13.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 06 -Of Lec 13.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4557adf9-e024-4698-8464-34bcd05dbaa8.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 06 -Of Lec 13.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 05 Solution Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 05 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 05 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/17cefdc3-9140-4ed1-88d4-4e3daa29c3ca.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 05 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 04 Solution Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 04 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 04 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f5e3b622-82b3-4c3a-9d0e-48a4ecfb4fd0.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 04 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 05 -Of Lec 11.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 05 -Of Lec 11.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 05 -Of Lec 11.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/aae30db0-b9a6-4fd9-b3c8-88507f5a44d9.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 05 -Of Lec 11.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 03 Solution Notes.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 03 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 03 Solution Notes.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/1c3e6288-aa45-41d9-aa98-0ae8c50b69f4.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 03 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 02 Solution Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 02 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 02 Solution Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/c36e9a6c-6bd8-4f08-bf42-9ab970e2c274.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 02 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 04 -Of Lec 08- .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 04 -Of Lec 08- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 04 -Of Lec 08- .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/5b4768e8-3b15-4582-8060-0b9429bbb4c8.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 04 -Of Lec 08- .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 01 Solution Notes .pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 01 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 01 Solution Notes .pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/32db9072-6d1f-4d0e-a5ca-74e8a75372c4.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 01 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 03 -Of Lec 07.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 03 -Of Lec 07.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 03 -Of Lec 07.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/886a5d00-28c7-4eb2-bc07-d43accf99839.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 03 -Of Lec 07.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 02 -Of Lec 06.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 02 -Of Lec 06.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 02 -Of Lec 06.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/00b5b378-e16e-4709-b9d9-71b8edaf85f3.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 02 -Of Lec 06.pdf" - skipping download"
fi
if [ ! -f "स्थिर विद्युत विभव तथा धारिता - DPP 01 -Of Lec 04.pdf" ]; then
    echo "\nStarting download: "स्थिर विद्युत विभव तथा धारिता - DPP 01 -Of Lec 04.pdf""
    yt-dlp --no-warnings --progress --console-title -o "स्थिर विद्युत विभव तथा धारिता - DPP 01 -Of Lec 04.pdf" "https://d2bps9p1kiy4ka.cloudfront.net/5eb393ee95fab7468a79d189/a3aaa9f3-41ed-4e49-a257-793221184447.pdf"
else
    echo "File exists: "स्थिर विद्युत विभव तथा धारिता - DPP 01 -Of Lec 04.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 04 : विद्युत धारा"
mkdir -p "Ch - 04 - विद्युत धारा" && cd "Ch - 04 - विद्युत धारा"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "विद्युत धारा 13 - R-C परिपथ - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 13 - R-C परिपथ - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 13 - R-C परिपथ - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjBkNzc5ZWEtOTZjZS00ZTRlLWE1MmYtMGNkOWM4ZDY1NmU4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.kXDvrDqu27vgQOa8aalsb_88-h4FDDRp2VkOBd3PzbE/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 13 - R-C परिपथ - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 12 - विभव मापी व उस पर  आधारित प्रश्न - कार्बन कोडिंग - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 12 - विभव मापी व उस पर  आधारित प्रश्न - कार्बन कोडिंग - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 12 - विभव मापी व उस पर  आधारित प्रश्न - कार्बन कोडिंग - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjhmMzNlMmItYjMzNC00N2M1LThiNDEtYmM5MWRhNmRmNzhmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.EG29OOJlSdyJ3IgZ7xH5qnkNNZa2WJgi-SI6gtLkVjw/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 12 - विभव मापी व उस पर  आधारित प्रश्न - कार्बन कोडिंग - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 11 - मापन यंत्र.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 11 - मापन यंत्र.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 11 - मापन यंत्र.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjMyZDgyYWItNzJkNC00ZWRjLTlhNGUtYWRiYmMwNTM1YmJhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.9W0XQu6EcSB_mrNXU242DQTADc1graM0LfEGiVt23KU/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 11 - मापन यंत्र.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 10 - सेलो के संयोजन पर आधारित प्रश्न - मापन यंत्रो - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 10 - सेलो के संयोजन पर आधारित प्रश्न - मापन यंत्रो - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 10 - सेलो के संयोजन पर आधारित प्रश्न - मापन यंत्रो - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTgyNTQ2N2QtODg1NS00NTA1LTgwMzktMWRlNWVjY2Q0NTcxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.zNxhrjT9octF9z-RBObi5eB5r2C8_mj_s4j6UWZSWfY/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 10 - सेलो के संयोजन पर आधारित प्रश्न - मापन यंत्रो - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 09 - Cell व Cells का संयोजन.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 09 - Cell व Cells का संयोजन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 09 - Cell व Cells का संयोजन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWNiZGVlNmQtMTdmNi00MWExLWE0NDYtOWQ1MGZjOWQ2ZmYwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.zekq2-8mkhsPySMOft15NFwvHoCAKSKLVp2EJGd0pJQ/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 09 - Cell व Cells का संयोजन.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 08 - शक्ति तथा प्रतिरोध में ऊष्मा हानि - बल्ब की Theory - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 08 - शक्ति तथा प्रतिरोध में ऊष्मा हानि - बल्ब की Theory - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 08 - शक्ति तथा प्रतिरोध में ऊष्मा हानि - बल्ब की Theory - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzAzMjg4ZDktOGY3OS00OGE0LTk4ZjMtNTE4MTRhMzYzYTkzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.xO9J7xQH0xZITwIuMkatMI6ZojHhOfDLycawa-4fjVg/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 08 - शक्ति तथा प्रतिरोध में ऊष्मा हानि - बल्ब की Theory - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 07 - विद्युत परिपथो का समतुल्य प्रतिरोध -Part -02 .mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 07 - विद्युत परिपथो का समतुल्य प्रतिरोध -Part -02 .mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 07 - विद्युत परिपथो का समतुल्य प्रतिरोध -Part -02 .mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTFkMDU4YjAtMjVmMC00YjY5LWIwM2ItYTc3NWVkYzI1ZDk3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7aByevZATcg2J5vFKX0YiK5C4YwXs7eFRojdTY-Q_oY/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 07 - विद्युत परिपथो का समतुल्य प्रतिरोध -Part -02 .mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 06 - विद्युत परिपथो का समतुल्य प्रतिरोध  - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 06 - विद्युत परिपथो का समतुल्य प्रतिरोध  - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 06 - विद्युत परिपथो का समतुल्य प्रतिरोध  - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2Q3ZTZiMjYtOTdmZS00ZDVmLWFhN2YtMTVjMzJjODdhMGVlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.V86HxBpB4PuSXIylZWYBI8MS6kI6HiGcUWvljtQrj6w/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 06 - विद्युत परिपथो का समतुल्य प्रतिरोध  - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 05 - परिपथो का समतुल्य प्रतिरोध - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 05 - परिपथो का समतुल्य प्रतिरोध - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 05 - परिपथो का समतुल्य प्रतिरोध - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmY0OGFmOTktNzEzNC00ZDMwLTgwODgtMTdjOWRhNmQ4NWVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.gm1FT_y5eYNgTSXnUmrHDAMJ6B6nTZpbcYGudw3T9oo/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 05 - परिपथो का समतुल्य प्रतिरोध - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 04 - ओम के नियम के अनुप्रयोग.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 04 - ओम के नियम के अनुप्रयोग.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 04 - ओम के नियम के अनुप्रयोग.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWUyMzUyM2EtYTRiMy00ZDk5LWJjNTktN2NmMjczYjRhZWRhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.qVRpCXvBx5oqCxSp2JV28s89TgtJ-sTNPQVF_F8q2bU/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 04 - ओम के नियम के अनुप्रयोग.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 03 - चालक में धारा पर  प्रश्न - ओम का नियम.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 03 - चालक में धारा पर  प्रश्न - ओम का नियम.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 03 - चालक में धारा पर  प्रश्न - ओम का नियम.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjEyMzEzMTktYmIyMy00NmVmLWI0MzgtMjEzMTdkZThhY2MyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Lnw0lnL4zn6CdzVLRlkGjs0bsyg42yyju3HPZjpHsOk/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 03 - चालक में धारा पर  प्रश्न - ओम का नियम.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 02 - ग्राफ़ - गतिशीलता - Rescheduled @4-10 PM.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 02 - ग्राफ़ - गतिशीलता - Rescheduled @4-10 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 02 - ग्राफ़ - गतिशीलता - Rescheduled @4-10 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2NjNTc1MGItY2E0NS00YzlkLTgyYjAtODRjMWNjZjE4NmMyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.y45Gt5shyDC7G0ztw0wAwRRlhINEcfbvmfrpcpMp2C8/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 02 - ग्राफ़ - गतिशीलता - Rescheduled @4-10 PM.mp4" - skipping download"
fi
if [ ! -f "विद्युत धारा 01 - Capacitor के मिश्रित प्रश्न - औसत तथा ताक्षणिक धारा - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत धारा 01 - Capacitor के मिश्रित प्रश्न - औसत तथा ताक्षणिक धारा - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 01 - Capacitor के मिश्रित प्रश्न - औसत तथा ताक्षणिक धारा - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzVlYTA3YjMtMWYxNi00ZDhiLTk3OTYtMjRmZmRjZDdiZmQ4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.PHjNCoR5DBv6urCt9KBzJlpXj9P92zCIqTqM-xd1JQE/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत धारा 01 - Capacitor के मिश्रित प्रश्न - औसत तथा ताक्षणिक धारा - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "विद्युत धारा 13 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 13 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 13 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/52f7681d-3179-4d0e-94ab-b8797fa1f7c7.pdf"
else
    echo "File exists: "विद्युत धारा 13 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 12 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 12 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 12 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/da8da3d7-d0cc-4552-ac51-3f89af4b39fa.pdf"
else
    echo "File exists: "विद्युत धारा 12 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 11 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 11 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 11 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2f650cd5-7080-4d2d-95e1-c0eb6609c699.pdf"
else
    echo "File exists: "विद्युत धारा 11 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 10 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 10 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 10 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0460dd08-5eac-4968-92da-4299cdd92c08.pdf"
else
    echo "File exists: "विद्युत धारा 10 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 09 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 09 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 09 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/bdee6db8-b6b8-4ea8-bdb0-9a6ee9bfd78f.pdf"
else
    echo "File exists: "विद्युत धारा 09 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 08 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 08 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 08 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/dd4602f5-a72e-4e37-9547-f98c65b6a553.pdf"
else
    echo "File exists: "विद्युत धारा 08 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 07 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 07 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 07 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/fcb7a5c3-f05b-4067-8f0a-22ed1a500ea1.pdf"
else
    echo "File exists: "विद्युत धारा 07 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 06 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 06 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 06 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6dcbaf38-353f-4774-abfa-d68387c83d2d.pdf"
else
    echo "File exists: "विद्युत धारा 06 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 05 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 05 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 05 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0574d3a2-aefe-40b0-830c-9f1cf89c34b5.pdf"
else
    echo "File exists: "विद्युत धारा 05 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 04 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/95ca9547-e729-443c-bd6f-8aa29e40d423.pdf"
else
    echo "File exists: "विद्युत धारा 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 03 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/84eb4806-0a70-4327-9f8c-419da9063b6c.pdf"
else
    echo "File exists: "विद्युत धारा 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/666826f4-1f7f-44f9-9a49-8512d64f59a2.pdf"
else
    echo "File exists: "विद्युत धारा 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/358d65ea-8be7-486e-8d65-e5d6e440db80.pdf"
else
    echo "File exists: "विद्युत धारा 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "विद्युत धारा - DPP 07 Solution Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 07 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 07 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9501100e-8abe-4f7e-b572-64f88777712b.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 07 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 07 -Extra DPP- .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 07 -Extra DPP- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 07 -Extra DPP- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6935366e-98da-4fb4-ac1d-87dad5a4d019.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 07 -Extra DPP- .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 05 Solution Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 05 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 05 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3fcec8c0-e19d-4fe7-959e-01f0e637ab3a.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 05 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 06 -Of Lec 11- .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 06 -Of Lec 11- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 06 -Of Lec 11- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/db6b9b61-c267-4438-a250-98942d37af8d.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 06 -Of Lec 11- .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 04 Solution Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 04 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 04 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2edc2aab-cd72-43dc-8f72-cd46a14fa83f.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 04 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 03 Solution Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 03 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 03 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c1bff677-070d-496a-9400-61d334c0a473.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 03 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 05 -Of Lec 09.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 05 -Of Lec 09.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 05 -Of Lec 09.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a4affa7f-8fa0-4e97-b811-554b3006b93e.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 05 -Of Lec 09.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 04 -Of Lec 07.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 04 -Of Lec 07.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 04 -Of Lec 07.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/67e060d9-3ca6-4e49-822f-e56ea9858700.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 04 -Of Lec 07.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 02 Solution Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 02 Solution Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 02 Solution Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/04bb5ffa-cbca-4198-9dae-672b428bb777.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 02 Solution Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 01 Solution Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 01 Solution Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 01 Solution Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/778a2c9b-ee64-4991-acd2-6b2304249432.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 01 Solution Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 03 -Of Lec 04.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 03 -Of Lec 04.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 03 -Of Lec 04.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d319833e-4dd3-430e-b42c-c2ae63501a7c.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 03 -Of Lec 04.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 02 -Of Lec 03.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 02 -Of Lec 03.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 02 -Of Lec 03.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f6925cb3-cda2-4706-9c4f-29e94f1d9845.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 02 -Of Lec 03.pdf" - skipping download"
fi
if [ ! -f "विद्युत धारा - DPP 01 -Of Lec 02.pdf" ]; then
    echo "\nStarting download: "विद्युत धारा - DPP 01 -Of Lec 02.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत धारा - DPP 01 -Of Lec 02.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/76a4f0c6-1f45-4500-bb56-0ff1120e4022.pdf"
else
    echo "File exists: "विद्युत धारा - DPP 01 -Of Lec 02.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 05 : गतिमान आवेश और चुंबकत्व"
mkdir -p "Ch - 05 - गतिमान आवेश और चुंबकत्व" && cd "Ch - 05 - गतिमान आवेश और चुंबकत्व"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "गतिमान आवेश और चुंबकत्व 11 - मिश्रित प्रश्न.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 11 - मिश्रित प्रश्न.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 11 - मिश्रित प्रश्न.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTYwODkwZjYtMGU2Mi00OTFmLTkxZmUtNWM1NjNkMTYyMzlhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.ePEEhTERqLuIo2vMDD7tUs0CXjCVdIlzxzHzGI3En_w/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 11 - मिश्रित प्रश्न.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 10 - चु॰ क्षे॰ धरवाही Loop -द्विध्रुव-  - NO DPP.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 10 - चु॰ क्षे॰ धरवाही Loop -द्विध्रुव-  - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 10 - चु॰ क्षे॰ धरवाही Loop -द्विध्रुव-  - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDZjZDQ0OWMtMjBhZi00YzhhLTllY2EtZjQ4YTk3ZWQxNTIwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.nFJDR7jXjujUjOlhN3H3VHORV5lkFORZzTwwnWuYZYw/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 10 - चु॰ क्षे॰ धरवाही Loop -द्विध्रुव-  - NO DPP.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 09 - धारावाही तार पर चुंबकिय बल.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 09 - धारावाही तार पर चुंबकिय बल.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 09 - धारावाही तार पर चुंबकिय बल.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjZmNWU2ZjEtOTI2Ny00ZDljLTgzMGMtNDg3MzQwZjg4NzM3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.W8xnueCLREX6Q5XE1tQ5k3VwgQo04xqgwmGcxSPYw8M/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 09 - धारावाही तार पर चुंबकिय बल.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 08 - एक समान चु॰ क्षे॰ में आवेशित कण की गति -Part -02.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 08 - एक समान चु॰ क्षे॰ में आवेशित कण की गति -Part -02.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 08 - एक समान चु॰ क्षे॰ में आवेशित कण की गति -Part -02.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWE5MmYxZjYtMDg3Ny00ZmI4LTkwMzktNWUzMzY0YjRmNzRmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.2Sc17MdqeWgXXyrj-CmMVkFmKoRo3RawkkTKMBMjppw/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 08 - एक समान चु॰ क्षे॰ में आवेशित कण की गति -Part -02.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 07 - एक समान चु॰ क्षे॰ में आवेशित कण की गति - NO DPP.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 07 - एक समान चु॰ क्षे॰ में आवेशित कण की गति - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 07 - एक समान चु॰ क्षे॰ में आवेशित कण की गति - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWQ3NzNkOTAtMzc0ZS00OTc4LTg4YWEtNDFiOTVmYWI5ZDAxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.sjgACyjhidMRZ2H5NNgacFQp5wolURK_DeMCN60vY7Y/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 07 - एक समान चु॰ क्षे॰ में आवेशित कण की गति - NO DPP.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 06 - Biot-Savart नियम व Ampere के नियम पर आधारित प्रश्न - NO DPP.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 06 - Biot-Savart नियम व Ampere के नियम पर आधारित प्रश्न - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 06 - Biot-Savart नियम व Ampere के नियम पर आधारित प्रश्न - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTI4YmE0MGItNjQ4OS00M2FkLTgxOTQtYjAxOTE1NzQ0NWVlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.4cNC4QwfgBcrCWnzRgOdauX_0sZ2tMn5SezLUaqWTmk/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 06 - Biot-Savart नियम व Ampere के नियम पर आधारित प्रश्न - NO DPP.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 05 - एम्पीयर के नियम के अनुप्रयोग - Rescheduled @ 04-10 PM.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 05 - एम्पीयर के नियम के अनुप्रयोग - Rescheduled @ 04-10 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 05 - एम्पीयर के नियम के अनुप्रयोग - Rescheduled @ 04-10 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNGYzZjdmMWMtM2NkNC00YjNjLWE2MzAtNTg3YzU0MTAzOGQxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.jrxK4WjG7602GvBX1QpUz7vnuJKpg0-fHVHHW-vRZCE/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 05 - एम्पीयर के नियम के अनुप्रयोग - Rescheduled @ 04-10 PM.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 04 - एम्पीयर का नियम - NO DPP.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 04 - एम्पीयर का नियम - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 04 - एम्पीयर का नियम - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNWZmNTFkYzQtNmUxZS00MDcyLTk0ZmItZjEzOWExYThlYTVlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.vFJEQDs7bVADqUaSIchBMwm_i0w_GonvNVM2QPyZ7ms/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 04 - एम्पीयर का नियम - NO DPP.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 03 - बायो - सर्वट के नियम के अनुप्रयोग - सीधे तार- चाप व वलय के कारण  चु॰ क्षे॰.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 03 - बायो - सर्वट के नियम के अनुप्रयोग - सीधे तार- चाप व वलय के कारण  चु॰ क्षे॰.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 03 - बायो - सर्वट के नियम के अनुप्रयोग - सीधे तार- चाप व वलय के कारण  चु॰ क्षे॰.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDFkZmJkZmMtYjFjNC00OTdhLWJhNWEtM2Q1Y2I3MzdiMjhlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Rhi97VHDLnqWfRhuH3BtMkzH6HY9ZpHOow-AYsaa7YQ/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 03 - बायो - सर्वट के नियम के अनुप्रयोग - सीधे तार- चाप व वलय के कारण  चु॰ क्षे॰.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 02 - बायो - सर्वट के नियम के अनुप्रयोग - NO DPP.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 02 - बायो - सर्वट के नियम के अनुप्रयोग - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 02 - बायो - सर्वट के नियम के अनुप्रयोग - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjNlODllM2ItM2I3Ny00ZjEzLTg3ZTQtNTg4MmJhNjc4N2EyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.iHtp5O_hN2-KbJYz8loHaNheGCzjnpuGQD8HU7m_x1o/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 02 - बायो - सर्वट के नियम के अनुप्रयोग - NO DPP.mp4" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 01 - सम्य स्थिरांक - Discharging RC परिपथ - धारा का  चु॰ प्रभाव -Introduction- - NO DPP.mp4" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 01 - सम्य स्थिरांक - Discharging RC परिपथ - धारा का  चु॰ प्रभाव -Introduction- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 01 - सम्य स्थिरांक - Discharging RC परिपथ - धारा का  चु॰ प्रभाव -Introduction- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDNjMWFkOTItY2JjYi00MjkzLWFhMzMtZDA0MjJmYjlhMDY1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.5IdLito9cno0dZm4LGVUQN9mRdW6LcBsQPKYmU9vFrY/hls/360/main.m3u8"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 01 - सम्य स्थिरांक - Discharging RC परिपथ - धारा का  चु॰ प्रभाव -Introduction- - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "गतिमान आवेश और चुंबकत्व 11 - Class Notes .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 11 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 11 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/52052e4b-611b-4aa8-b2ec-dd49681cb11a.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 11 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 10 - Class Notes .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 10 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 10 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/86fc1d2d-c27e-49cf-92e3-3e2066a907c6.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 10 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 09 - Class Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 09 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 09 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f4c3d763-fd65-4afa-95d9-6138f8c90e91.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 09 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 08 - Class Notes .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 08 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 08 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/97b4986e-d8f7-4adf-a3c5-b7ac5da04d2b.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 08 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 07 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4c65e9fd-8ec6-453d-a67d-496df102bd0b.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 06 - Class Notes .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 06 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 06 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/698edf3d-d0e6-418b-9d03-3fcfd27796f0.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 06 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 05 - Class Notes .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 05 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 05 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6d4713a5-8460-45d0-889e-017e0d6ca10a.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 05 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 04 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0258ebb9-7cf6-4e15-ae6f-40dd7561441d.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 03 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6c0da35a-4d4b-48d4-949c-9d4f6b5542ee.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8ff0569a-d350-4449-a99d-5851b0bfac21.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b1eb252a-9f82-4f8d-8de2-1bc5c0577005.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "गतिमान आवेश और चुंबकत्व - DPP 06 -Extra DPP.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - DPP 06 -Extra DPP.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - DPP 06 -Extra DPP.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7b604d63-9dc0-46a0-80f5-646bdfd60daf.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - DPP 06 -Extra DPP.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व - DPP 05 -Of Lec 11- .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - DPP 05 -Of Lec 11- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - DPP 05 -Of Lec 11- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/0bf44d94-7e9c-41d2-8423-639d833f7f3d.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - DPP 05 -Of Lec 11- .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व - DPP 04 -Of Lec 09.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - DPP 04 -Of Lec 09.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - DPP 04 -Of Lec 09.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4145767d-ae61-4d26-8fe4-a2e5d40581b7.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - DPP 04 -Of Lec 09.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व - DPP 03 -Of Lec 08.pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - DPP 03 -Of Lec 08.pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - DPP 03 -Of Lec 08.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7fda9195-d1ef-46e2-9531-3c51cdb449bc.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - DPP 03 -Of Lec 08.pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व - DPP 02 -Of Lec 05- .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - DPP 02 -Of Lec 05- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - DPP 02 -Of Lec 05- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/bc785a03-f7c3-4b14-b9e5-1a662e76d118.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - DPP 02 -Of Lec 05- .pdf" - skipping download"
fi
if [ ! -f "गतिमान आवेश और चुंबकत्व - DPP 01 -Of Lec 03- .pdf" ]; then
    echo "\nStarting download: "गतिमान आवेश और चुंबकत्व - DPP 01 -Of Lec 03- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "गतिमान आवेश और चुंबकत्व - DPP 01 -Of Lec 03- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/692a098e-4d92-4d73-ac35-6b744c42b0ae.pdf"
else
    echo "File exists: "गतिमान आवेश और चुंबकत्व - DPP 01 -Of Lec 03- .pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 06 : चुम्बकत्व तथा प्रदार्थ"
mkdir -p "Ch - 06 - चुम्बकत्व तथा प्रदार्थ" && cd "Ch - 06 - चुम्बकत्व तथा प्रदार्थ"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 04 - पदार्थो के चु॰ गुण - NO  DPP.mp4" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 04 - पदार्थो के चु॰ गुण - NO  DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 04 - पदार्थो के चु॰ गुण - NO  DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzZlNTRiZTctODA0YS00YTRjLWI2MjEtNmY2MTVlNzBhMjVlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Bw62SnXtM9eLI_1bbdu0Sn_vWjlLEYr0rwuT2aWXNv8/hls/360/main.m3u8"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 04 - पदार्थो के चु॰ गुण - NO  DPP.mp4" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 03 - चुम्बकीय द्विध्रुव -Part - 02.mp4" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 03 - चुम्बकीय द्विध्रुव -Part - 02.mp4""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 03 - चुम्बकीय द्विध्रुव -Part - 02.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNzgyZjdiZTYtMmM5OC00ZDlkLTg1Y2ItYzhkODc0ZDJkZGQ4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.xZUC23_54mXB82rBid4RkfWo9EGrOEwXRzPSWfX_Wr0/hls/360/main.m3u8"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 03 - चुम्बकीय द्विध्रुव -Part - 02.mp4" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 02 - चुम्बकीय द्विध्रुव - NO DPP.mp4" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 02 - चुम्बकीय द्विध्रुव - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 02 - चुम्बकीय द्विध्रुव - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMWY2YzcxNjEtYWM4MC00YjBhLTgwMmEtZTFjNDQ3YzU1ZDRhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.XEfDy1HbHIHSnov-zM3IVopJbcjTsUP3NRKepdkYWOM/hls/360/main.m3u8"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 02 - चुम्बकीय द्विध्रुव - NO DPP.mp4" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 01 - छड चुंबक - NO DPP.mp4" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 01 - छड चुंबक - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 01 - छड चुंबक - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjYwYTdiMWMtMzYwZS00MmZjLWJiMDYtYzZlNGM1MDQwZDViIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.8VbPHHodeCVv55PgGhvlUtBMyX--JV9QdpuZx5NeGx4/hls/360/main.m3u8"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 01 - छड चुंबक - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 04 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4d7d3986-ca77-43d6-bf27-4d216d934b40.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 03 - Class Notes .pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 03 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 03 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/abc71aff-fba7-455f-8ca2-0c63a228c1b3.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 03 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 02 - Class Notes .pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 02 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 02 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/27cb9d0c-2a2e-49e7-905a-17c50e786aef.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 02 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "चुम्बकत्व तथा प्रदार्थ 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2882951a-a4a4-4793-aefc-2364310a8837.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "चुम्बकत्व तथा प्रदार्थ - DPP 01 -Of Lec 03.pdf" ]; then
    echo "\nStarting download: "चुम्बकत्व तथा प्रदार्थ - DPP 01 -Of Lec 03.pdf""
    yt-dlp --no-warnings --progress --console-title -o "चुम्बकत्व तथा प्रदार्थ - DPP 01 -Of Lec 03.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b1c16378-63a8-4224-863a-0b79ba159faa.pdf"
else
    echo "File exists: "चुम्बकत्व तथा प्रदार्थ - DPP 01 -Of Lec 03.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 07 : विद्युत चुम्बकीय प्रेरण"
mkdir -p "Ch - 07 - विद्युत चुम्बकीय प्रेरण" && cd "Ch - 07 - विद्युत चुम्बकीय प्रेरण"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "विद्युत चुम्बकीय प्रेरण 09 - प्रेरित विद्युत क्षेत्र - Rescheduled @04-10 PM.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 09 - प्रेरित विद्युत क्षेत्र - Rescheduled @04-10 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 09 - प्रेरित विद्युत क्षेत्र - Rescheduled @04-10 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDQ0NDVkNjYtOWVhYi00YTVmLTg2MmYtYjVkOTYyMmM0ZDRiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.E4f2DYXQ_TA9USteBdmxhkeNZWfKTbVRz1ZJKf6TvPk/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 09 - प्रेरित विद्युत क्षेत्र - Rescheduled @04-10 PM.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 08 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश -Part - 02- - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 08 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश -Part - 02- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 08 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश -Part - 02- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDg2Zjc0YjktMDgxNC00ODZmLWE5ZWUtOGE2NDljZjAyYzMwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.7Q2V04j_Ww-pGEJ7sFQxbe--cQ8yjUQWt5aDGkA54ms/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 08 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश -Part - 02- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 07 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश - Rescheduled @06-25 PM.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 07 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश - Rescheduled @06-25 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 07 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश - Rescheduled @06-25 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzNjYTk3YmItYjExZi00MzFiLTlmZWEtMDQzNGRkYzk5MTg2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.1d4ziwTmP8h9xcjF2kJdWzqYp2CsffIJlDTmMgGevb0/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 07 - प्रेरकत्त्वो का सयोजन - प्रश्न अभ्याश - Rescheduled @06-25 PM.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 06 - अन्योन प्रेरण गुणांक ज्ञात करना - युग्म गुणांक.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 06 - अन्योन प्रेरण गुणांक ज्ञात करना - युग्म गुणांक.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 06 - अन्योन प्रेरण गुणांक ज्ञात करना - युग्म गुणांक.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOThjY2M3NjYtODY4My00NDk3LWEyNTItYTY4NDEyZTk2ZDZhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.p8aGH2pE7uwLSfy84R9pyD21aPfJ5GaLe4V4actcMrs/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 06 - अन्योन प्रेरण गुणांक ज्ञात करना - युग्म गुणांक.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 05 - स्व प्रेरण व अन्योन प्रेरण.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 05 - स्व प्रेरण व अन्योन प्रेरण.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 05 - स्व प्रेरण व अन्योन प्रेरण.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMTFmOWM5NDQtYjIyNC00MjQ3LWJkNmItYzUzNGMxODQxZGI0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Lpj26aP9oUBuqIUWrhPTE-X-1o_A28bTPBl3ro7k4nk/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 05 - स्व प्रेरण व अन्योन प्रेरण.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 04 - Faraday's Law एवं गतिक विद्युत वाहक बल पर आधारित प्रश्न - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 04 - Faraday's Law एवं गतिक विद्युत वाहक बल पर आधारित प्रश्न - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 04 - Faraday's Law एवं गतिक विद्युत वाहक बल पर आधारित प्रश्न - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDc1OTc1MGYtMDM5ZS00NWM2LTk0NDctZjY5OTM2NmRhNTQ1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.j97VrSvS2QWOU_e-f27eDIYzejdMqxdi3G6ODNDOT2w/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 04 - Faraday's Law एवं गतिक विद्युत वाहक बल पर आधारित प्रश्न - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 03 - फैराडे के नियम के अनुप्रयोग.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 03 - फैराडे के नियम के अनुप्रयोग.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 03 - फैराडे के नियम के अनुप्रयोग.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjMyODk5NjYtMGE0NS00OThiLTk0NzItZDM2MTVkNjdiMzRjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.iKZDuYnEOPX35rGkKj8wdLK7EWsCdGzwN2un49edrYA/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 03 - फैराडे के नियम के अनुप्रयोग.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 02 - घूमती हुयी Rod में प्रेरित॰ वि॰ बल - फैराडे का नियम - लेंज का नियम.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 02 - घूमती हुयी Rod में प्रेरित॰ वि॰ बल - फैराडे का नियम - लेंज का नियम.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 02 - घूमती हुयी Rod में प्रेरित॰ वि॰ बल - फैराडे का नियम - लेंज का नियम.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjIyYTlmNWUtOTBmNS00Yjk5LThhNjAtNjI3NWI4MGQzNjc3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.pkjDBDfgopY3WUNpfwY0bYtviN5BQGsG2zQJj6yPGmY/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 02 - घूमती हुयी Rod में प्रेरित॰ वि॰ बल - फैराडे का नियम - लेंज का नियम.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 01 - गतिक विद्युत वाहक बल - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 01 - गतिक विद्युत वाहक बल - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 01 - गतिक विद्युत वाहक बल - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMGI4Njc2YzctN2Y5Yy00ZjcxLTllOTQtYWU1Y2M4ZWQ5M2JjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.0We3X-2M1tTAW32clj4TpCzqaFbopy0QnmQ7USH-X7U/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 01 - गतिक विद्युत वाहक बल - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "विद्युत चुम्बकीय प्रेरण 09 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 09 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 09 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/57ed11d5-87b8-484c-b8e4-67c07d47607a.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 09 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 08 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 08 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 08 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7b19a498-4af8-4f35-a1f8-7be13475d953.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 08 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 07 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 07 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 07 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e7f8207e-decc-47d8-9ea1-82e1ab6709a1.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 07 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 06 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 06 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 06 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6330cd57-5420-4566-a1c2-85b74f52d57e.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 06 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 05 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 05 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 05 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5b88b541-b01c-4050-9ebe-ab56a945d584.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 05 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 04 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/57ab2ee3-0ea2-4515-9c73-42e2facde5a2.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 03 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/62b6f2ad-091f-4ddb-b94b-65b3db2bce28.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d5767716-14e1-4e6b-9de8-4a02381ac9cf.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण 01 - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण 01 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण 01 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/439a57e9-3db2-4aa2-afd5-6ec8a10162e5.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण 01 - Class Notes .pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "विद्युत चुम्बकीय प्रेरण - DPP 06 -Of Lec 09.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - DPP 06 -Of Lec 09.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - DPP 06 -Of Lec 09.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/256a444d-b7ef-432c-97e3-f172ce68729c.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - DPP 06 -Of Lec 09.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण - DPP 05 -Of Lec 07.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - DPP 05 -Of Lec 07.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - DPP 05 -Of Lec 07.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/803ec2da-8b9f-4f23-82a2-c7098916d321.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - DPP 05 -Of Lec 07.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण - DPP 04 -Of Lec 06.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - DPP 04 -Of Lec 06.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - DPP 04 -Of Lec 06.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/05d895a3-504c-4c45-8a8a-e5e5b6fa7370.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - DPP 04 -Of Lec 06.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण - DPP 03 -Of Lec 05.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - DPP 03 -Of Lec 05.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - DPP 03 -Of Lec 05.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/cb6ede67-a294-499c-a625-c5bdc0ecf62b.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - DPP 03 -Of Lec 05.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण - DPP 02 -Of Lec 03- .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - DPP 02 -Of Lec 03- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - DPP 02 -Of Lec 03- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d75fac73-a438-4edd-ac0f-b07af095717b.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - DPP 02 -Of Lec 03- .pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय प्रेरण - DPP 01 -Of Lec 02- .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय प्रेरण - DPP 01 -Of Lec 02- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय प्रेरण - DPP 01 -Of Lec 02- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/58c0996f-cb8b-422f-9f01-bbf7cad00462.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय प्रेरण - DPP 01 -Of Lec 02- .pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 08 : प्रत्यावर्ती धारा"
mkdir -p "Ch - 08 - प्रत्यावर्ती धारा" && cd "Ch - 08 - प्रत्यावर्ती धारा"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "प्रत्यावर्ती धारा 05 - गुणवत्ता गुणांक - प्रश्न - Recorded.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 05 - गुणवत्ता गुणांक - प्रश्न - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 05 - गुणवत्ता गुणांक - प्रश्न - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNWUyOTRlNTctYzEyYi00ZWI4LTk5OGYtNjQ0MWI2Njg5NDVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.AFZyXgk1riWltq0m_OmaWfuqlKETGTyCT0VBkbZqD-A/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 05 - गुणवत्ता गुणांक - प्रश्न - Recorded.mp4" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 04 -  L-C व L-C-R परिपथ - अनुनाद - प्रश्न -Part - 02- - NO DPP.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 04 -  L-C व L-C-R परिपथ - अनुनाद - प्रश्न -Part - 02- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 04 -  L-C व L-C-R परिपथ - अनुनाद - प्रश्न -Part - 02- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjYyNTRlODEtNjhjNy00ZmYyLTliMDUtZjdjZWMxNDY0NDk3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.HsnmZyQUXgmK1DhgNbAMK1xkwplHQiiX9rpMD7SXUSo/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 04 -  L-C व L-C-R परिपथ - अनुनाद - प्रश्न -Part - 02- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 03 - L-C व  L-C-R परिपथ - अनुनाद - प्रश्न.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 03 - L-C व  L-C-R परिपथ - अनुनाद - प्रश्न.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 03 - L-C व  L-C-R परिपथ - अनुनाद - प्रश्न.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzIyOTgyNzMtMGY0ZS00NDU2LTgyMjgtYjRlNWI0NmY3OGIxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.UdbLHrvRvPdxEaypN4qFNGXmzUEsLlkbouotkaSB7D4/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 03 - L-C व  L-C-R परिपथ - अनुनाद - प्रश्न.mp4" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 02 - AC परिपथ में- परिपथ के विभिन्न अवयव - L-R व R-C परिपथ.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 02 - AC परिपथ में- परिपथ के विभिन्न अवयव - L-R व R-C परिपथ.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 02 - AC परिपथ में- परिपथ के विभिन्न अवयव - L-R व R-C परिपथ.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODEzYTVmYjMtZDI2Zi00MTAyLTkyNDAtNTZiMjQyNDljNmM4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.UH3lIq0ro_N6tfZTyfYoieHalAPCDaFP4Q3hnaxwQUg/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 02 - AC परिपथ में- परिपथ के विभिन्न अवयव - L-R व R-C परिपथ.mp4" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 01 - औसत धारा तथा RMS धारा - NO DPP.mp4" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 01 - औसत धारा तथा RMS धारा - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 01 - औसत धारा तथा RMS धारा - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDdhMzRmOWMtZWVmNC00YzVlLWIxOTEtZTZiYjIxMzdiNTk4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.MbUeu1bprZj6R02QtaoJEc8qxPvvzOjodEiwyTF3QsM/hls/360/main.m3u8"
else
    echo "File exists: "प्रत्यावर्ती धारा 01 - औसत धारा तथा RMS धारा - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "प्रत्यावर्ती धारा 05 - Class Notes .pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 05 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 05 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1b82f345-0ddd-4aad-91ea-1eac86733fc2.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 05 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 04 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ab105636-dfca-4cee-9246-2a58ca5db92f.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 03 -  Class Notes.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 03 -  Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 03 -  Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ab19f395-c25e-4b65-841b-00e10e20aa61.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 03 -  Class Notes.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ee7c7529-51cb-4388-8672-626e367a88bd.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/88991d58-9bdf-4b78-8fec-fb50c38a65dd.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "प्रत्यावर्ती धारा - DPP 05 -Extra DPP- .pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा - DPP 05 -Extra DPP- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा - DPP 05 -Extra DPP- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/cc972320-ebe2-4abf-82af-5f9dc172447f.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा - DPP 05 -Extra DPP- .pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा - DPP 04 -Extra DPP- .pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा - DPP 04 -Extra DPP- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा - DPP 04 -Extra DPP- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/491c3ba8-6aad-449c-8aaa-2f2d76c6b04b.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा - DPP 04 -Extra DPP- .pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा - DPP 03 -Of Lec 05.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा - DPP 03 -Of Lec 05.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा - DPP 03 -Of Lec 05.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2ef0306b-7b48-47ff-afff-2354bff522dd.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा - DPP 03 -Of Lec 05.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा - DPP 02 -Of Lec 03.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा - DPP 02 -Of Lec 03.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा - DPP 02 -Of Lec 03.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/cd19b96f-14fd-48a7-a9b2-2123e1a01395.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा - DPP 02 -Of Lec 03.pdf" - skipping download"
fi
if [ ! -f "प्रत्यावर्ती धारा - DPP 01 -Of Lec 02.pdf" ]; then
    echo "\nStarting download: "प्रत्यावर्ती धारा - DPP 01 -Of Lec 02.pdf""
    yt-dlp --no-warnings --progress --console-title -o "प्रत्यावर्ती धारा - DPP 01 -Of Lec 02.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/31c3b96b-da8d-418e-b778-b860cf1a3def.pdf"
else
    echo "File exists: "प्रत्यावर्ती धारा - DPP 01 -Of Lec 02.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 09 : विद्युत चुम्बकीय तरंगें"
mkdir -p "Ch - 09 - विद्युत चुम्बकीय तरंगें" && cd "Ch - 09 - विद्युत चुम्बकीय तरंगें"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "विद्युत चुम्बकीय तरंगें 03 - विद्युत चुम्बकीय तरंगे - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें 03 - विद्युत चुम्बकीय तरंगे - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें 03 - विद्युत चुम्बकीय तरंगे - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYjM3NjQxYzgtNzk3Mi00ZTI1LTk2MDAtOWJmZjYyODU0NDQzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Ezd-g5X_frqduVtgkCeozfgSNaiglVg7vXz8hs9u8gI/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें 03 - विद्युत चुम्बकीय तरंगे - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय तरंगें 02 - भँवर धाराये - विद्युत चुम्बकीय तरंगे - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें 02 - भँवर धाराये - विद्युत चुम्बकीय तरंगे - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें 02 - भँवर धाराये - विद्युत चुम्बकीय तरंगे - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmEzYzMzYTMtMTBlNS00N2MzLWEzOWEtMmFkNDk1ZDFmMDkwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.kVbrbqq-ruGk1DVxgKuA7bTex1Q32cf-uNyk_IdNWBU/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें 02 - भँवर धाराये - विद्युत चुम्बकीय तरंगे - NO DPP.mp4" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय तरंगें 01 - ट्राँसफार्मर - NO DPP.mp4" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें 01 - ट्राँसफार्मर - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें 01 - ट्राँसफार्मर - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzg1MjM5ZWYtYjk4Ni00NjU1LWEyMTItOGQxZjBkYzQwZmVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.qOtfuCJpwCGgoJLsgHsxdpRx4afJPyj1Sl7V6zRnR1c/hls/360/main.m3u8"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें 01 - ट्राँसफार्मर - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "विद्युत चुम्बकीय तरंगें 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें 03 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ce03174c-ca04-41c4-a974-82236b36cdf3.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय तरंगें 02  Class Notes  Lakshya JEE Hindi 2025.pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें 02  Class Notes  Lakshya JEE Hindi 2025.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें 02  Class Notes  Lakshya JEE Hindi 2025.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ee14d538-82bd-438a-8686-16f752e682fb.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें 02  Class Notes  Lakshya JEE Hindi 2025.pdf" - skipping download"
fi
if [ ! -f "विद्युत चुम्बकीय तरंगें 01  - Class Notes .pdf" ]; then
    echo "\nStarting download: "विद्युत चुम्बकीय तरंगें 01  - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "विद्युत चुम्बकीय तरंगें 01  - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/576cd20e-8b60-44c9-97ae-7184b53574c0.pdf"
else
    echo "File exists: "विद्युत चुम्बकीय तरंगें 01  - Class Notes .pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 10 : किरण प्रकाशिकी एवं प्रकाशिक उपकरण"
mkdir -p "Ch - 10 - किरण प्रकाशिकी एवं प्रकाशिक उपकरण" && cd "Ch - 10 - किरण प्रकाशिकी एवं प्रकाशिक उपकरण"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Prism का संयोजन - प्रकाशिक यंत्र -सूक्ष्मदर्शी.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Prism का संयोजन - प्रकाशिक यंत्र -सूक्ष्मदर्शी.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Prism का संयोजन - प्रकाशिक यंत्र -सूक्ष्मदर्शी.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGU0MDc3NzMtMjU2ZS00M2E2LTk1MWQtZTk1NTE2NGM0NDA4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.30ZzT9GUDx_vr3k7XBOypKdul60iBqLSfRy5Uykbkow/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Prism का संयोजन - प्रकाशिक यंत्र -सूक्ष्मदर्शी.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - प्रिज्म.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - प्रिज्म.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - प्रिज्म.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZDJiNzgxNjAtNmNmMC00MGI0LTg0NjktMWNiNzc5NmQ1OWU2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.LsgacMmDkdDyUEuK1ZB8mnKLYWtuMPvtnPOTublLmcw/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - प्रिज्म.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - लेंस और दर्पण के मिश्रित प्रश्न.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - लेंस और दर्पण के मिश्रित प्रश्न.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - लेंस और दर्पण के मिश्रित प्रश्न.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTc5YmZhNWMtZDhkYi00YmQ4LWIzYmQtZTIyMDY0NDE4Yjc0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.tNlxXG8wiUPPTRCSxigIBJOJne1cbSWUWTdhpPjnSdY/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - लेंस और दर्पण के मिश्रित प्रश्न.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - लेंस पर आधारित प्रश्‍न.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - लेंस पर आधारित प्रश्‍न.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - लेंस पर आधारित प्रश्‍न.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzkyMzAxZjYtMTEwZi00YTQ1LWFkMTktZTcyNWNjN2RjMjY4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Qu2q7-Xp3FW9neqNzAGFwzngTtm3STMwAo7QZhtAZFU/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - लेंस पर आधारित प्रश्‍न.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - न्यूटन का सूत्र - विस्थापन विधि से उत्तल लेंस की  फोकस दूरी ज्ञात करना है​.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - न्यूटन का सूत्र - विस्थापन विधि से उत्तल लेंस की  फोकस दूरी ज्ञात करना है​.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - न्यूटन का सूत्र - विस्थापन विधि से उत्तल लेंस की  फोकस दूरी ज्ञात करना है​.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjQzN2Y2MjctNGU3Ny00YmQ4LWIwYmMtODYyYWZkY2YxYzgxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.XWE_pwhaYeLHY6VsDZTPQYiQPmkyMSN2Lp16psIY-yg/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - न्यूटन का सूत्र - विस्थापन विधि से उत्तल लेंस की  फोकस दूरी ज्ञात करना है​.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - लेंस से अपवर्तन -Part -02- - NO DPP.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - लेंस से अपवर्तन -Part -02- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - लेंस से अपवर्तन -Part -02- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWUyMDMyYWMtOTFkZC00ZGJhLWJhMjUtMTI5Yzc4OGQzZWNlIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.t4eeOE99SmFAI562R6seMDRzZv19u2T7jrSZbXsHOkc/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - लेंस से अपवर्तन -Part -02- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 -  लेंस से अपवर्तन - NO DPP.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 -  लेंस से अपवर्तन - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 -  लेंस से अपवर्तन - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMmU3YTI4NDktZGRiYi00ZDZhLThjNWQtZDg0Y2UxNDFmNTVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Y6ixPCWqtmgdhTwSkgwk4NJLmj7jC-tpq_ll0ndolik/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 -  लेंस से अपवर्तन - NO DPP.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - वक्र सतह से अपवर्तन.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - वक्र सतह से अपवर्तन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - वक्र सतह से अपवर्तन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2EwNTgxZDQtZmQ1Zi00ZDYzLTkxYjQtZmU1MDNhZWZkMGY4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.kLsNX7vGHdPZNL4n6Fo7AHFMVrjtp4AW4JCL6L6OsUw/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - वक्र सतह से अपवर्तन.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - परावर्तन  व अपवर्तन पर आधारित प्रश्न.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - परावर्तन  व अपवर्तन पर आधारित प्रश्न.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - परावर्तन  व अपवर्तन पर आधारित प्रश्न.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjQ2ZDFiYjAtODI1YS00MWFmLWI2YTAtMGEzOTIxNWUzN2MzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.dGqNKIN7K2r8o5N9pGCB5rs-tI0HYmMWgHeUawRl8go/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - परावर्तन  व अपवर्तन पर आधारित प्रश्न.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - अपवर्तन - पूर्ण आंतरिक परावर्तन - NO DPP.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - अपवर्तन - पूर्ण आंतरिक परावर्तन - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - अपवर्तन - पूर्ण आंतरिक परावर्तन - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzBlMTVkM2MtZTU0Mi00ZjNjLThiZTUtMzM2NGFlODBmN2MyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.YYwyBbghvHKmZ3wVUu115tVzuFiBM8s4niTSHL8Otuw/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - अपवर्तन - पूर्ण आंतरिक परावर्तन - NO DPP.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - गोलीय दर्पण के प्रश्न - समतल सतह  से अपवर्तन.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - गोलीय दर्पण के प्रश्न - समतल सतह  से अपवर्तन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - गोलीय दर्पण के प्रश्न - समतल सतह  से अपवर्तन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzgzZGY4ZDMtYjFhMC00MTRjLWJiZDQtMWNiZWNjM2IzZWE0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.tf_ymm7TX2XgasR1fLBKT1vtz7gKcU9nwGzqKKefYEw/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - गोलीय दर्पण के प्रश्न - समतल सतह  से अपवर्तन.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - गोलीय दर्पण से परावर्तन -Part - 02- - NO DPP - Rescheduled @04-15 PM.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - गोलीय दर्पण से परावर्तन -Part - 02- - NO DPP - Rescheduled @04-15 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - गोलीय दर्पण से परावर्तन -Part - 02- - NO DPP - Rescheduled @04-15 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNjJiN2Y5NDgtZDJiMC00NDY2LWFjNTYtYjFkNTQ4YzlhNWMxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.o_j2ASMn1pa4KAYLjGDqkDtQv6fUaypNvG7inqQDgzc/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - गोलीय दर्पण से परावर्तन -Part - 02- - NO DPP - Rescheduled @04-15 PM.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - गोलीय दर्पण से परावर्तन - Rescheduled @ 04-08 PM.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - गोलीय दर्पण से परावर्तन - Rescheduled @ 04-08 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - गोलीय दर्पण से परावर्तन - Rescheduled @ 04-08 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzRmNDg4OTQtZjlkMC00ZDZkLTg4NDEtMjM2ZDkzNThhYmMzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.t8jO1yWKCUroSjPEs0Vrs3yECCi-KwbhJeLYjgB8y2Y/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - गोलीय दर्पण से परावर्तन - Rescheduled @ 04-08 PM.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 - समतल दर्पण से परावर्तन के प्रश्न - गोलीय दर्पण - Introduction - NO DPP.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 - समतल दर्पण से परावर्तन के प्रश्न - गोलीय दर्पण - Introduction - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 - समतल दर्पण से परावर्तन के प्रश्न - गोलीय दर्पण - Introduction - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNDRiYTk1MGYtNzNiNS00MGE3LTgzYTEtY2Y1NDI3NzkxOWQ0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.38zSxUKlASCI3pc0lhEfx5HnaiokDFdEWcn1UuYdPww/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 - समतल दर्पण से परावर्तन के प्रश्न - गोलीय दर्पण - Introduction - NO DPP.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - समतल दर्पण से परावर्तन.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - समतल दर्पण से परावर्तन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - समतल दर्पण से परावर्तन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWJmYzcxZTYtZjlhZS00ZmQ5LTk0NTAtNGY2OThmOTAwMzNmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.aezG_yU_o2nhI9V7XWgjB7BuX199zOYeyHZmUdDPMMU/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - समतल दर्पण से परावर्तन.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - समतल दर्पण से परावर्तन - मोटर में Back EMF - NO DPP.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - समतल दर्पण से परावर्तन - मोटर में Back EMF - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - समतल दर्पण से परावर्तन - मोटर में Back EMF - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZTA5ZTQ0MzItMjAwZS00NDY2LWIxOTEtNTA2ZWM3ZDRjNzc2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Or-cx9K8CAV6zYVCwW05Ru3CCStQajk_ZQgso71SfeY/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - समतल दर्पण से परावर्तन - मोटर में Back EMF - NO DPP.mp4" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - विद्युत चु॰ तरंगो  पर आधारित प्रश्न - प्रकाशिकी - Introduction - NO DPP.mp4" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - विद्युत चु॰ तरंगो  पर आधारित प्रश्न - प्रकाशिकी - Introduction - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - विद्युत चु॰ तरंगो  पर आधारित प्रश्न - प्रकाशिकी - Introduction - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYzg0OWZlMjktN2U2Yy00YTdhLTlmNmYtMmNhMjQ0YTc1MDQ5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.wxgOR7z7LAqs62mMymI3XjxqdYMHDLwL8wXQxRLh9CM/hls/360/main.m3u8"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - विद्युत चु॰ तरंगो  पर आधारित प्रश्न - प्रकाशिकी - Introduction - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/110fd76d-7c54-4a6c-8d48-b7c6ad653244.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 17 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5810e958-a6a5-46b4-82a0-70d9fd68a5f4.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 16 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/17177807-3fa3-4b23-a244-d0f33bf1dc7c.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 15 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1aa78b9e-3837-490c-94cb-0efdd86e0ba7.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 14 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f844402f-3d25-41b1-b947-48d7596ad835.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 13 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d7870fd4-c15f-45f7-866a-39280ce4b62c.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 12 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/906e72f3-fa73-475f-bea5-dfe78a1be7ea.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 11 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - Class Notes .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/59e808c6-9e04-4336-bdec-1bb6bd38c51c.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 10 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/42d654b1-56a7-4469-8c20-fe29db782d52.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 09 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/da421ba4-5658-4d99-be2d-4afae42ac9f5.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 08 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/38f54237-74eb-4548-a24d-5a1ffe8dd025.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - Class Notes .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/05ad1331-533c-41f2-a35a-16fad6b810fc.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 06 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/07aed6f8-23ab-4e80-9532-f32b5e2bafe6.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 05 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 -Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 -Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 -Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/88c6dd2e-b062-4be2-a938-4d7db76e1d9d.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 04 -Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - Class Notes .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9f7ab9c1-d9de-4516-aff2-1751c4b984f7.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 03 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/10e92d4a-4ef0-4402-a9d9-1bba65a8442e.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - Class Notes .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/80733e5b-128e-4937-8b3d-599ee70ea7aa.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण 01 - Class Notes .pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 13 -Extra DPP.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 13 -Extra DPP.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 13 -Extra DPP.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/84c78125-4073-4be0-9fcb-7ea579440326.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 13 -Extra DPP.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 12 -Extra DPP.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 12 -Extra DPP.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 12 -Extra DPP.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a60357e6-44c3-4437-9806-8223729ee8b3.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 12 -Extra DPP.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 11 -Extra DPP.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 11 -Extra DPP.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 11 -Extra DPP.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/5fc4604f-bb45-4d79-bd9b-b90c736091df.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 11 -Extra DPP.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 10 -Of Lec 17.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 10 -Of Lec 17.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 10 -Of Lec 17.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1b51cee5-92a3-4d6b-8d3c-2669c8a79c7e.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 10 -Of Lec 17.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 09 -Of Lec 16.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 09 -Of Lec 16.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 09 -Of Lec 16.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8d85da74-805a-4499-8431-131e2764a004.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 09 -Of Lec 16.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 08 -Of Lec 15.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 08 -Of Lec 15.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 08 -Of Lec 15.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/8995dfa0-93d1-49d1-88f3-4c83f9698b3f.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 08 -Of Lec 15.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 07 -Of Lec 14.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 07 -Of Lec 14.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 07 -Of Lec 14.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/39de1f3a-50d2-4eea-8e85-73afd9026aa1.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 07 -Of Lec 14.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 06 -Of Lec 13- .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 06 -Of Lec 13- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 06 -Of Lec 13- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7f4904ce-19f1-4aba-8378-cee48c1f9fa3.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 06 -Of Lec 13- .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 05 -Of Lec 10.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 05 -Of Lec 10.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 05 -Of Lec 10.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ff528ec1-d5e7-4ca4-a05f-e30ebcdd945e.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 05 -Of Lec 10.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 04 -Of Lec 09.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 04 -Of Lec 09.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 04 -Of Lec 09.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b7425fdc-0762-4c33-a1ac-e5667d6a6045.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 04 -Of Lec 09.pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 03 -Of Lec 07- .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 03 -Of Lec 07- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 03 -Of Lec 07- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/7eabf413-0fc1-465b-b474-c968a0931d6b.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 03 -Of Lec 07- .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 02 -Of Lec 05- .pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 02 -Of Lec 05- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 02 -Of Lec 05- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a582037d-66e2-40ab-94e2-4fae71b312cf.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 02 -Of Lec 05- .pdf" - skipping download"
fi
if [ ! -f "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 01 -Of Lec 03.pdf" ]; then
    echo "\nStarting download: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 01 -Of Lec 03.pdf""
    yt-dlp --no-warnings --progress --console-title -o "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 01 -Of Lec 03.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b8edcf8c-a6e8-4eff-8cb0-65274d6e7771.pdf"
else
    echo "File exists: "किरण प्रकाशिकी एवं प्रकाशिक उपकरण - DPP 01 -Of Lec 03.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 11 : अर्धचालक इलेक्ट्रॉनिक्स"
mkdir -p "Ch - 11 - अर्धचालक इलेक्ट्रॉनिक्स" && cd "Ch - 11 - अर्धचालक इलेक्ट्रॉनिक्स"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 08 - दिष्टकारी - फिल्टर परिपथ  - Zener Diode.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 08 - दिष्टकारी - फिल्टर परिपथ  - Zener Diode.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 08 - दिष्टकारी - फिल्टर परिपथ  - Zener Diode.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiODkxY2YxYmEtOWZjZi00MjZhLThmMjYtMzVmN2M2M2IzMjYyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.fHDKzIfogMV8LNYVkGrEhTjN6FOG9bW5y9l6pbwGHNE/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 08 - दिष्टकारी - फिल्टर परिपथ  - Zener Diode.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 07 -  Diode  का विश्लेषण व प्रश्न - NO DPP.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 07 -  Diode  का विश्लेषण व प्रश्न - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 07 -  Diode  का विश्लेषण व प्रश्न - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTA5OTFhYmUtNGJjOC00ODIxLWEwYmItZTQyYTFhZTgyYmJhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.rNQgedAipbXnoXxKSN5eeh_tuVpRqFA4pB_JwG4iBOA/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 07 -  Diode  का विश्लेषण व प्रश्न - NO DPP.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 06 - डायोड में अभिनति -Biasing- - डायोड का भंजन.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 06 - डायोड में अभिनति -Biasing- - डायोड का भंजन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 06 - डायोड में अभिनति -Biasing- - डायोड का भंजन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNTlmNmIwYjQtYTVmNC00ZjYwLThjMmQtNmRjNmEwN2Q4ZWI3IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.4b4TtikjfGgCWguvuURbmfp4f6TYAwUd3qHnVCJ-tuI/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 06 - डायोड में अभिनति -Biasing- - डायोड का भंजन.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 05 - द्रव्यानुपाती क्रिया नियम - P - N संधि बिना Baising के - NO  DPP.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 05 - द्रव्यानुपाती क्रिया नियम - P - N संधि बिना Baising के - NO  DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 05 - द्रव्यानुपाती क्रिया नियम - P - N संधि बिना Baising के - NO  DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTJiNzFhNzctYTYxOC00YjI0LWI5NDUtYzI1N2VmODI0NmEwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.j90ml5P0OT48ORq-yg-aKFWaV_2rNwADVxBNteLzeN8/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 05 - द्रव्यानुपाती क्रिया नियम - P - N संधि बिना Baising के - NO  DPP.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 04 - शुद्ध अर्धचालक - N Type अर्धचालक - P Type अर्धचालक.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 04 - शुद्ध अर्धचालक - N Type अर्धचालक - P Type अर्धचालक.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 04 - शुद्ध अर्धचालक - N Type अर्धचालक - P Type अर्धचालक.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYTA4OTVhNTMtZDQ1OS00MjVjLTk4NWItZWI5MDE1NDcxMjUzIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.__8iepyYPMPKBpRR1jWTlbI2_OssHyRGV4Uk7bINS0o/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 04 - शुद्ध अर्धचालक - N Type अर्धचालक - P Type अर्धचालक.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 03 - अर्धचालक - NO DPP.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 03 - अर्धचालक - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 03 - अर्धचालक - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiN2EzOThmOGUtOTViYy00NzFmLTk2NWEtNGM2NmE4MGRiNDYyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.qdAQ4NfcmZos42Om-kG3xUjghwuVqivADQ11kMTXx7M/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 03 - अर्धचालक - NO DPP.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 02 - ध्रुवण  के तरीके - ध्रुवण पर आधारित प्रश्न - NO DPP.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 02 - ध्रुवण  के तरीके - ध्रुवण पर आधारित प्रश्न - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 02 - ध्रुवण  के तरीके - ध्रुवण पर आधारित प्रश्न - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2VlOTI5MjUtZWY3MC00NGI5LWIzZTYtZGVjYzAyNDJlZjAxIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.EoWqg9sKs-jolvB_376Pk2Ym0mpAI2SeNMpO2d7npK8/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 02 - ध्रुवण  के तरीके - ध्रुवण पर आधारित प्रश्न - NO DPP.mp4" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 01 - लॉजिक द्वार - बुलीयन बीजगणित - Recorded.mp4" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 01 - लॉजिक द्वार - बुलीयन बीजगणित - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 01 - लॉजिक द्वार - बुलीयन बीजगणित - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2FlMTdkMTItODczYS00YTA3LTkwYjEtOThjMThkZTFlNzI1IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.R3caw0lV_VxOAO24U3Cv9tJYH8WFaidFHWY5hWzq0hI/hls/360/main.m3u8"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 01 - लॉजिक द्वार - बुलीयन बीजगणित - Recorded.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 08 - Class Notes .pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 08 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 08 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b5291562-4bc9-45b1-b6e8-48371ac8d902.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 08 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 07 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/3fe4af77-21f1-4efc-a3fc-c552024fe6c1.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 06 - Class Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 06 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 06 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b381b939-53bd-4a9c-ae24-1a905e123c5f.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 06 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 05 - Class Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 05 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 05 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/11a89008-7c15-4f5d-83e8-5b0679aa2117.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 05 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 04 - Class Notes .pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 04 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 04 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/845612e2-ae07-45cd-b9aa-9844ab3ba1c6.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 04 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 03 -  Class Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 03 -  Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 03 -  Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e475e9f0-4522-44db-a169-855c5712f6d3.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 03 -  Class Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/dc8817ff-f35b-4dd3-811b-8a3d1d0eda99.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/efdc6cc4-db90-4000-8717-119a1ff82216.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स - DPP 04 -Of Lec 08.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 04 -Of Lec 08.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स - DPP 04 -Of Lec 08.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/c8029f8f-3f0c-45ac-8d7c-8d1259a4f11a.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 04 -Of Lec 08.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स - DPP 03 -Of Lec 06.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 03 -Of Lec 06.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स - DPP 03 -Of Lec 06.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b503132f-0adc-425e-9a3a-c37d8bf9d249.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 03 -Of Lec 06.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स - DPP 02 -Of Lec 04.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 02 -Of Lec 04.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स - DPP 02 -Of Lec 04.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9c6a9f5d-00dc-475d-a635-0af8fc71ff03.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 02 -Of Lec 04.pdf" - skipping download"
fi
if [ ! -f "अर्धचालक इलेक्ट्रॉनिक्स - DPP 01.pdf" ]; then
    echo "\nStarting download: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 01.pdf""
    yt-dlp --no-warnings --progress --console-title -o "अर्धचालक इलेक्ट्रॉनिक्स - DPP 01.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f7365d1a-7d7d-47cf-a765-2ec6b9821a1f.pdf"
else
    echo "File exists: "अर्धचालक इलेक्ट्रॉनिक्स - DPP 01.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 12 : तरंग प्रकाशीय"
mkdir -p "Ch - 12 - तरंग प्रकाशीय" && cd "Ch - 12 - तरंग प्रकाशीय"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "तरंग प्रकाशीय 08 -  प्रकाश वैद्युत  प्रभाव.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 08 -  प्रकाश वैद्युत  प्रभाव.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 08 -  प्रकाश वैद्युत  प्रभाव.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMzE5ODg3YjYtZDNmYS00NDg1LWJmNTctYzI1MTY0N2YyMmNjIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.D4ZcLaGEvNAMD6MZ_CmmoZ_XNGo2TJEWEaCU7v89_tA/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 08 -  प्रकाश वैद्युत  प्रभाव.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 07 - विवर्तन.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 07 - विवर्तन.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 07 - विवर्तन.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDZmMjZjZTItMWEwYi00ODIxLTk3ZjAtZGMwOWIxMzg0MDNiIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.b47evGrERY4ijEIH7rem9Dpf34FSm653I0xk42oiBIw/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 07 - विवर्तन.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 06 - व्यतिकरण पर आधारित प्रश्न -  विवर्तन -Introduction- - NO DPP.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 06 - व्यतिकरण पर आधारित प्रश्न -  विवर्तन -Introduction- - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 06 - व्यतिकरण पर आधारित प्रश्न -  विवर्तन -Introduction- - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNGQyZTUzYTItYTA5NC00OGE3LTgyY2QtZDY1NmVmYjA2NmI2IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.cndiWvJOgtj4yV53oCIeKPWGLsLzjJhrwoEIVrqvbZc/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 06 - व्यतिकरण पर आधारित प्रश्न -  विवर्तन -Introduction- - NO DPP.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 05 - व्यतिकरण के विभिन्न case - Rescheduled @06-30 PM.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 05 - व्यतिकरण के विभिन्न case - Rescheduled @06-30 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 05 - व्यतिकरण के विभिन्न case - Rescheduled @06-30 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDg5OGY4MzQtMGExNi00ZDQyLThjY2YtNTM1Mjc2ZWIxM2E5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.uAeBLict2EmLCrXh3IYrZSruePE2uUuiu66JvGxeOA4/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 05 - व्यतिकरण के विभिन्न case - Rescheduled @06-30 PM.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 04 - YDSE पर आधारित प्रश्न - YDSE में  विभिदिताये.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 04 - YDSE पर आधारित प्रश्न - YDSE में  विभिदिताये.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 04 - YDSE पर आधारित प्रश्न - YDSE में  विभिदिताये.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYmMzNDAzNDctZWQzZS00Y2QxLTgxNWMtZmU1NDA2OWQzNzA0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Gn-ZHOgXR60cRQ8qqw08P2VZBjsGf1DoYjWBPvb3d3Q/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 04 - YDSE पर आधारित प्रश्न - YDSE में  विभिदिताये.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 03 - व्यतिकरण में परिणामी तीव्रता - यंग द्वि स्लिट प्रयोग - NO DPP.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 03 - व्यतिकरण में परिणामी तीव्रता - यंग द्वि स्लिट प्रयोग - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 03 - व्यतिकरण में परिणामी तीव्रता - यंग द्वि स्लिट प्रयोग - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZmI0YjRmMDctNDU2ZC00Y2Q5LTkwOTgtMWIzNmIzNGE3YmQwIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.z5T0Om5xc1znHfaByXQLfEcU2KGNOwcniIyeY0otPeY/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 03 - व्यतिकरण में परिणामी तीव्रता - यंग द्वि स्लिट प्रयोग - NO DPP.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 02 - हाइगेन का सिद्धांत - व्यतिकरण होने की शर्त - NO DPP.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 02 - हाइगेन का सिद्धांत - व्यतिकरण होने की शर्त - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 02 - हाइगेन का सिद्धांत - व्यतिकरण होने की शर्त - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZjhjMzc0NGMtMWNlNy00ZDRjLTljYWUtOGYwMjM5NGY5YTE4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.b-ony8f5Le32rMAM39m-HVa-qWM7hG_eYZMnwlmqugs/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 02 - हाइगेन का सिद्धांत - व्यतिकरण होने की शर्त - NO DPP.mp4" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 01 - प्रकाशिक यंत्र - नेत्र दोष -  NO DPP.mp4" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 01 - प्रकाशिक यंत्र - नेत्र दोष -  NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 01 - प्रकाशिक यंत्र - नेत्र दोष -  NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOGMzMDg0NjYtNDc3OC00ZTE0LWIyZTEtN2RiM2UzODI5Nzk4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.QUpCf__OFiNm6Hlvp0lvDdIqyMYagPCTNP15WLynmns/hls/360/main.m3u8"
else
    echo "File exists: "तरंग प्रकाशीय 01 - प्रकाशिक यंत्र - नेत्र दोष -  NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "तरंग प्रकाशीय 08 - Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 08 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 08 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/4962dad0-0bd5-4253-a066-2cea314a4028.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 08 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 07 - Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 07 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 07 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/d7bfc528-a61e-4200-a693-7d0973c2aec3.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 07 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 06 - Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 06 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 06 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/6627720b-598d-4044-9163-c926bea1ce89.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 06 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 05 - Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 05 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 05 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b71bbe9e-1523-4fba-b91c-9faa67779f72.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 05 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 04 - Class Notes .pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 04 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 04 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/aa74399c-c2b6-4c66-9941-e2d098ae40ba.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 04 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 03 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/a60dd0ea-710b-4a60-8074-2dee2294f479.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 02 -Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 02 -Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 02 -Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b75c2ac6-c518-4083-a8ab-1b0479a96829.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 02 -Class Notes.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/39f217e7-3600-4951-8e97-b916a3f24683.pdf"
else
    echo "File exists: "तरंग प्रकाशीय 01 - Class Notes.pdf" - skipping download"
fi
cd ..


mkdir -p "DPP Notes"
cd "DPP Notes"
if [ ! -f "तरंग प्रकाशीय - DPP 04 -Of Lec 08.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय - DPP 04 -Of Lec 08.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय - DPP 04 -Of Lec 08.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/75e19394-1092-47d1-ad6e-46357242b74a.pdf"
else
    echo "File exists: "तरंग प्रकाशीय - DPP 04 -Of Lec 08.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय - DPP 03 -Of Lec 06.pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय - DPP 03 -Of Lec 06.pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय - DPP 03 -Of Lec 06.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b90fb7c6-3e79-4e20-b3ab-a0a9eab54001.pdf"
else
    echo "File exists: "तरंग प्रकाशीय - DPP 03 -Of Lec 06.pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय - DPP 02 -Of Lec 05- .pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय - DPP 02 -Of Lec 05- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय - DPP 02 -Of Lec 05- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/9baba90e-f98a-42fa-a31e-3f25173468ec.pdf"
else
    echo "File exists: "तरंग प्रकाशीय - DPP 02 -Of Lec 05- .pdf" - skipping download"
fi
if [ ! -f "तरंग प्रकाशीय  - DPP 01 -Of Lec 04- .pdf" ]; then
    echo "\nStarting download: "तरंग प्रकाशीय  - DPP 01 -Of Lec 04- .pdf""
    yt-dlp --no-warnings --progress --console-title -o "तरंग प्रकाशीय  - DPP 01 -Of Lec 04- .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/1a89573b-1d6e-489a-8f3c-73e61eb9e0d9.pdf"
else
    echo "File exists: "तरंग प्रकाशीय  - DPP 01 -Of Lec 04- .pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 13 : विकिरण तथा प्रदार्थ की द्वैत प्रकृति"
mkdir -p "Ch - 13 - विकिरण तथा प्रदार्थ की द्वैत प्रकृति" && cd "Ch - 13 - विकिरण तथा प्रदार्थ की द्वैत प्रकृति"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "विकिरण तथा पदार्थ की द्वैत प्रकृति 02 - प्रकाश विद्युत प्रभाव - NO DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "विकिरण तथा पदार्थ की द्वैत प्रकृति 02 - प्रकाश विद्युत प्रभाव - NO DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा पदार्थ की द्वैत प्रकृति 02 - प्रकाश विद्युत प्रभाव - NO DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiNGNmZjVlNjktNmU3Ny00NjFjLWE1YjMtYTM4NWMwNzcwNTcyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.M_cb_dUVMRom57hX4PkNPA1m2EbPbKyrtSgeLb7noZU/hls/360/main.m3u8"
else
    echo "File exists: "विकिरण तथा पदार्थ की द्वैत प्रकृति 02 - प्रकाश विद्युत प्रभाव - NO DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
if [ ! -f "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - फोटोन - पदार्थ की द्वैत प्रकृति - NO DPP - Extra Lecture - Recorded.mp4" ]; then
    echo "\nStarting download: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - फोटोन - पदार्थ की द्वैत प्रकृति - NO DPP - Extra Lecture - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - फोटोन - पदार्थ की द्वैत प्रकृति - NO DPP - Extra Lecture - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMDA5ZGQ5ZjYtOGI3Ni00MzhkLTgyNzQtN2ViMzE4MWM0OTI4IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Xd3nFnx0o4C5UAF19KeBQDnmA-ReI4U1ANWohoVqBMU/hls/360/main.m3u8"
else
    echo "File exists: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - फोटोन - पदार्थ की द्वैत प्रकृति - NO DPP - Extra Lecture - Recorded.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 02 -  Class Notes.pdf" ]; then
    echo "\nStarting download: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 02 -  Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 02 -  Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/42377db1-d830-432d-a493-d1bcd876a846.pdf"
else
    echo "File exists: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 02 -  Class Notes.pdf" - skipping download"
fi
if [ ! -f "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ab950560-128e-47a5-9767-33e256935e70.pdf"
else
    echo "File exists: "विकिरण तथा प्रदार्थ की द्वैत प्रकृति 01 - Class Notes.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 14 : परमाणु संरचना"
mkdir -p "Ch - 14 - परमाणु संरचना" && cd "Ch - 14 - परमाणु संरचना"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "परमाणु संरचना 03 - Bohr के मॉडल के अनुप्रयोग - NO DPP - Recorded.mp4" ]; then
    echo "\nStarting download: "परमाणु संरचना 03 - Bohr के मॉडल के अनुप्रयोग - NO DPP - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु संरचना 03 - Bohr के मॉडल के अनुप्रयोग - NO DPP - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2JmYWY0OTktZWU0MC00OTA4LWJkMjItMmEzOTgwNThmMTU0IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.fLFnVJUDPCz-u50CxjT_ES2PGDOr9sVtlI3DfzlUEek/hls/360/main.m3u8"
else
    echo "File exists: "परमाणु संरचना 03 - Bohr के मॉडल के अनुप्रयोग - NO DPP - Recorded.mp4" - skipping download"
fi
if [ ! -f "परमाणु संरचना 02 - Bohr का मॉडल - परमाणु मॉडल - NO DPP - Recorded.mp4" ]; then
    echo "\nStarting download: "परमाणु संरचना 02 - Bohr का मॉडल - परमाणु मॉडल - NO DPP - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु संरचना 02 - Bohr का मॉडल - परमाणु मॉडल - NO DPP - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiOTZmNTNmOGItNGMxNy00MzcxLTg3YzAtNjE5ZjJlYWM1MGQ5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.PFYIHjXDKosU6xXf8zn2d-A-7wEkmT-UBDJ7rOPdNZQ/hls/360/main.m3u8"
else
    echo "File exists: "परमाणु संरचना 02 - Bohr का मॉडल - परमाणु मॉडल - NO DPP - Recorded.mp4" - skipping download"
fi
if [ ! -f "परमाणु संरचना 01 - रदरफ़ोर्ड  का मॉडल - बोहर का मॉडल - NO DPP - Recorded.mp4" ]; then
    echo "\nStarting download: "परमाणु संरचना 01 - रदरफ़ोर्ड  का मॉडल - बोहर का मॉडल - NO DPP - Recorded.mp4""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु संरचना 01 - रदरफ़ोर्ड  का मॉडल - बोहर का मॉडल - NO DPP - Recorded.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZmQ0YmI0MjMtMGQ1My00ZDg2LTljZTItZWVlMDFmNzQ0NjVhIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.fqcaod1str_MWYhQqCVCkOSjsKgiHST0fZXU9x02sQc/hls/360/main.m3u8"
else
    echo "File exists: "परमाणु संरचना 01 - रदरफ़ोर्ड  का मॉडल - बोहर का मॉडल - NO DPP - Recorded.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "परमाणु संरचना 03 - Class Notes .pdf" ]; then
    echo "\nStarting download: "परमाणु संरचना 03 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु संरचना 03 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/e8f46dc2-ea42-420e-b237-f53ac929f673.pdf"
else
    echo "File exists: "परमाणु संरचना 03 - Class Notes .pdf" - skipping download"
fi
if [ ! -f "परमाणु संरचना 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "परमाणु संरचना 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु संरचना 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/ed7edd51-00ea-4586-8114-f5a4bec16f07.pdf"
else
    echo "File exists: "परमाणु संरचना 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "परमाणु संरचना 01 - Class Notes.pdf" ]; then
    echo "\nStarting download: "परमाणु संरचना 01 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "परमाणु संरचना 01 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/b8293a32-07f1-4dc0-8bfc-e3958b46c20e.pdf"
else
    echo "File exists: "परमाणु संरचना 01 - Class Notes.pdf" - skipping download"
fi
cd ..

cd ..

echo ":: Chapter: Ch - 15 : नाभिक"
mkdir -p "Ch - 15 - नाभिक" && cd "Ch - 15 - नाभिक"

mkdir -p "Lectures"
cd "Lectures"
if [ ! -f "नाभिक 04 - समान्तर क्षय - श्रेणी क्षय - NO DPP.mp4" ]; then
    echo "\nStarting download: "नाभिक 04 - समान्तर क्षय - श्रेणी क्षय - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 04 - समान्तर क्षय - श्रेणी क्षय - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiY2FlZTI5Y2UtMzlmYS00YjI2LWJjMTAtNWYwM2IzOTFjMjJkIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.5SN4hcA8QAEOSGuyJYl3Y59K-Xb1iKQ--CU72cJSNmQ/hls/360/main.m3u8"
else
    echo "File exists: "नाभिक 04 - समान्तर क्षय - श्रेणी क्षय - NO DPP.mp4" - skipping download"
fi
if [ ! -f "नाभिक 03 - नाभिकीय सक्रियता - NO DPP.mp4" ]; then
    echo "\nStarting download: "नाभिक 03 - नाभिकीय सक्रियता - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 03 - नाभिकीय सक्रियता - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiZWZmNjRiMWMtMGE0Yi00NGViLWE1NDUtNGRiY2I3YWRmYzcyIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.58BY7Pg72gn7QzfqSSmEMqVeL3qI53tPDol6ShK89EI/hls/360/main.m3u8"
else
    echo "File exists: "नाभिक 03 - नाभिकीय सक्रियता - NO DPP.mp4" - skipping download"
fi
if [ ! -f "नाभिक 02 - q - मान par आधारित प्रश्न - α- β- and γ Decay - NO DPP - Rescheduled @04 -10 PM.mp4" ]; then
    echo "\nStarting download: "नाभिक 02 - q - मान par आधारित प्रश्न - α- β- and γ Decay - NO DPP - Rescheduled @04 -10 PM.mp4""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 02 - q - मान par आधारित प्रश्न - α- β- and γ Decay - NO DPP - Rescheduled @04 -10 PM.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiMjNkNGYxZGEtZjkwNi00MGMzLThlNDktOWJhOWVhZmNmNDc5IiwiZXhwIjoxNzQ4Mzc0MDU5fQ.wjSRV4iXSMR75bx5DpqNpUUWkmqGGXeXoI6UoQhc28Y/hls/360/main.m3u8"
else
    echo "File exists: "नाभिक 02 - q - मान par आधारित प्रश्न - α- β- and γ Decay - NO DPP - Rescheduled @04 -10 PM.mp4" - skipping download"
fi
if [ ! -f "नाभिक 01 - नाभिक - बंधन ऊर्जा - Q -  मान - NO DPP.mp4" ]; then
    echo "\nStarting download: "नाभिक 01 - नाभिक - बंधन ऊर्जा - Q -  मान - NO DPP.mp4""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 01 - नाभिक - बंधन ऊर्जा - Q -  मान - NO DPP.mp4" "https://stream.pwjarvis.app/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlb0lkIjoiYWRjOTJhNGUtZDM3Zi00NjI4LThlMWItNGFjOGY4YWQ0YjBmIiwiZXhwIjoxNzQ4Mzc0MDU5fQ.Wu580Tq1YN7DIrJCfX5LyjEsWjHGkZyOC6bUgxTMy_8/hls/360/main.m3u8"
else
    echo "File exists: "नाभिक 01 - नाभिक - बंधन ऊर्जा - Q -  मान - NO DPP.mp4" - skipping download"
fi
cd ..


mkdir -p "Class Notes"
cd "Class Notes"
if [ ! -f "नाभिक 04 - Class Notes.pdf" ]; then
    echo "\nStarting download: "नाभिक 04 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 04 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/509bea09-4ba8-4f6c-bfd4-bb1b27de9b75.pdf"
else
    echo "File exists: "नाभिक 04 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "नाभिक 03 - Class Notes.pdf" ]; then
    echo "\nStarting download: "नाभिक 03 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 03 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/f0715ec8-1158-4c83-a485-07e72834655a.pdf"
else
    echo "File exists: "नाभिक 03 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "नाभिक 02 - Class Notes.pdf" ]; then
    echo "\nStarting download: "नाभिक 02 - Class Notes.pdf""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 02 - Class Notes.pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/2a7bc596-2592-479b-bb11-14b84a469bb9.pdf"
else
    echo "File exists: "नाभिक 02 - Class Notes.pdf" - skipping download"
fi
if [ ! -f "नाभिक 01 - Class Notes .pdf" ]; then
    echo "\nStarting download: "नाभिक 01 - Class Notes .pdf""
    yt-dlp --no-warnings --progress --console-title -o "नाभिक 01 - Class Notes .pdf" "https://static.pw.live/5eb393ee95fab7468a79d189/ADMIN/216fe723-b030-470e-a106-fd7a88f2d148.pdf"
else
    echo "File exists: "नाभिक 01 - Class Notes .pdf" - skipping download"
fi
cd ..

cd ..
cd ..

echo "Script completed. Press Enter to exit."
read -p ""