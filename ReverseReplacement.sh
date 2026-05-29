#!/bin/bash

# --- Setup Paths ---
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"
FIND_DIR="$HOME/Downloads"
BACKUP_PATH="$FIND_DIR/backupCursor"

# 1. Check if Backup exists; if not, create it and COPY original files into it
if [ ! -d "$BACKUP_PATH" ]; then
    echo "Backup doesn't exist, cannot continue!"
else
    echo "Backup folder already exists. Skipping backup step."

  echo "------------------------------------------------"

# 2. Ask to continue with the switch (Split into echo + read for reliability)
sleep 1
echo -r -p "Continuing!"

echo "------------------------------------------------"

if [[ -f "$BACKUP_PATH/ArrowFarCursor.png" && "BACKUP_PATH/ArrowCursor.png" ]]; then
        echo "Reversing custom cursors..."
        sudo cp "$BACKUP_PATH/ArrowFarCursor.png" "$UI_DIR/ArrowFarCursor.png"
        sudo cp "$BACKUP_PATH/ArrowCursor.png" "$UI_DIR/ArrowCursor.png"
        echo "--- Finished! Restart Roblox to see changes. ---"
    else
        echo "Error: Could not find 'ArrowFarCursor.png' in $FIND_DIR"
        echo "Please make sure your new cursor is named exactly 'cursor.png' inside your Downloads folder."
    fi
    
fi
