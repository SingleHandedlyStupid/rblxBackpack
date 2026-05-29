#!/bin/bash

# --- SETTINGS & PATHS ---
# Path 1: The original UI folder
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"
FIND_DIR="/Documents/cursor.png"
echo "--- Applying Textures (Admin password required) ---"

# 2. Specifically replace icon__backpack.png with your backpack_down.png
# We use the copy we just downloaded to cache
if [ -f "$DL_DIR/Backpack_down.png" ]; then
    sudo cp "$FIND_DIR" "$UI_DIR/ArrowFarCursor.png"
    sudo cp "$FIND_DIR" "$UI_DIR/ArrowCursor.png"
fi

echo "--- Finished! Restart Roblox to see changes. ---"
