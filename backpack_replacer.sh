#!/bin/bash

# 1. The exact folder inside Roblox where the backpack files live
TARGET_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/ui/backpack"

# 2. A safe folder to download and store your custom files locally
DL_DIR="$HOME/Documents/RobloxBackpackBackup"

# Create the backup/download directory if it doesn't exist
mkdir -p "$DL_DIR"

echo "============================================="
echo " Starting Roblox Backpack Texture Replacer "
echo "============================================="

# 3. Define the list of files to download (using the proper raw GitHub URLs)
# Format is: "URL|Local_Filename"
FILES=(
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack.png|Backpack.png"
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack%402x.png|Backpack@2x.png"
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack_down.png|Backpack_Down.png"
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack_down%402x.png|Backpack_Down@2x.png"
)

# --- STEP 1: DOWNLOAD NEW TEXTURES ---
for ITEM in "${FILES[@]}"; do
    URL="${ITEM%%|*}"
    FILENAME="${ITEM##*|}"
    
    # Download the files to your local folder if they aren't there yet
    if [ ! -f "$DL_DIR/$FILENAME" ]; then
        echo " Downloading $FILENAME from GitHub..."
        curl -L "$URL" -o "$DL_DIR/$FILENAME"
    else
        echo " $FILENAME already downloaded locally."
    fi
done

# --- STEP 2: REPLACE THEM IN ROBLOX ---
echo ""
echo "Moving custom textures into the Roblox folder..."
echo "⚠️ You may be prompted to enter your Mac password because this modifies an App."
echo ""

# Loop again to copy them over into Roblox using administrative permissions (sudo)
for ITEM in "${FILES[@]}"; do
    FILENAME="${ITEM##*|}"
    
    if [ -f "$DL_DIR/$FILENAME" ]; then
        # sudo cp forces the file overwrite even in protected folders
        sudo cp "$DL_DIR/$FILENAME" "$TARGET_DIR/$FILENAME"
        echo "✓ Replaced: $FILENAME"
    else
        echo "✗ Error: Missing downloaded file for $FILENAME"
    fi
done

echo ""
echo "✨ Success! Your custom backpack icons are ready. Restart Roblox to see them."
