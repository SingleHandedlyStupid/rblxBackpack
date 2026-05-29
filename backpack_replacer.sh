#!/bin/bash

# --- SETTINGS & PATHS ---
# Path 1: The original UI folder
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/ui/backpack"
# Path 2: The MenuBar folder
MENU_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/ui/MenuBar"

# Local cache folder
DL_DIR="$HOME/Downloads/RobloxBackpackBackup"
mkdir -p "$DL_DIR"

# List of files to download (URL|Local_Filename)
FILES=(
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack.png|Backpack.png"
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack%402x.png|Backpack@2x.png"
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack_down.png|Backpack_down.png"
    "https://raw.githubusercontent.com/SingleHandedlyStupid/rblxBackpack/main/Backpack_down%402x.png|Backpack_down@2x.png"
)

echo "--- Downloading Latest Textures ---"
for ITEM in "${FILES[@]}"; do
    URL="${ITEM%%|*}"
    FILENAME="${ITEM##*|}"
    curl -L "$URL" -o "$DL_DIR/$FILENAME" -s
done

echo "--- Applying Textures (Admin password may be required) ---"

# 1. Replace the standard 4 files in the UI directory
for ITEM in "${FILES[@]}"; do
    FILENAME="${ITEM##*|}"
    # Use sudo to overwrite files in /Applications
    sudo cp "$DL_DIR/$FILENAME" "$UI_DIR/$FILENAME"
    echo "Done: $UI_DIR/$FILENAME"
done

# 2. Specifically replace icon__backpack.png with your backpack_down.png
# We use the copy we just downloaded to cache
if [ -f "$DL_DIR/Backpack_down.png" ]; then
    sudo cp "$DL_DIR/Backpack_down.png" "$MENU_DIR/icon__backpack.png"
    sudo cp "$DL_DIR/Backpack_down.png" "/Applications/Roblox.app/Contents/Resources/content/textures/MenuBar/icon__backpack.png"
    echo "Done: $MENU_DIR/icon__backpack.png (Replaced with Backpack_down)"
fi

echo "--- Finished! Restart Roblox to see changes. ---"
