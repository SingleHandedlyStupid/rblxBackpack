#!/bin/bash

# The correct path to Roblox textures
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"

# The correct path to YOUR Documents folder
FIND_DIR="$HOME/Downloads"

# Running the copy commands
sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowFarCursor.png"
sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowCursor.png"

echo "--- Finished! Restarting Roblox to see changes. ---"
killall "Roblox"
