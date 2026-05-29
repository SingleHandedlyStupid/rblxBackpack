#!/bin/bash

# Use the $HOME variable to ensure it finds your user folder
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"
SOURCE_FILE="$HOME/Documents/cursor.png"

# Check if the source cursor exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ Error: cursor.png not found in Documents!"
    exit 1
fi

# Check if Roblox is installed
if [ ! -d "$UI_DIR" ]; then
    echo "❌ Error: Roblox path not found. Is it installed in Applications?"
    exit 1
fi

echo "🚀 Applying custom cursor..."

# Perform the copy with sudo
sudo cp "$SOURCE_FILE" "$UI_DIR/ArrowFarCursor.png"
sudo cp "$SOURCE_FILE" "$UI_DIR/ArrowCursor.png"

echo "--- ✅ Finished! Restart Roblox to see changes. ---"
