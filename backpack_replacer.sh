#!/bin/bash

UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"
FIND_DIR="/Documents"

sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowFarCursor.png"
sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowCursor.png"

echo "--- Finished! Restart Roblox to see changes. ---"
