#!/bin/bash

# --- Setup Paths ---
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"
FIND_DIR="$HOME/Downloads"
BACKUP_PATH="$FIND_DIR/backupCursor"

# 1. Check if Backup exists; if not, create it and COPY original files into it
if [ ! -d "$BACKUP_PATH" ]; then
    echo "Backup doesn't exist. Creating backup now... 2"
    mkdir -p "$BACKUP_PATH"
    
    # Copy the original Roblox cursors to your backup folder
    cp "$UI_DIR/ArrowFarCursor.png" "$BACKUP_PATH/" 2>/dev/null
    cp "$UI_DIR/ArrowCursor.png" "$BACKUP_PATH/" 2>/dev/null
    echo "Original textures saved to $BACKUP_PATH"
else
    echo "Backup folder already exists. Skipping backup step."
fi

echo "------------------------------------------------"

# 2. Ask to continue with the switch (Split into echo + read for reliability)
read -p "Do you want to proceed? (y/n) " choice

echo "------------------------------------------------"

case "$choice" in 
  y|Y|yes|Yes ) 
    # Check if your custom cursor actually exists in Downloads
    if [ -f "$FIND_DIR/cursor.png" ]; then
        echo "Applying custom cursors..."
        sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowFarCursor.png"
        sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowCursor.png"
        echo "--- Finished! Restart Roblox to see changes. ---"
    else
        echo "Error: Could not find 'cursor.png' in $FIND_DIR"
        echo "Please make sure your new cursor is named exactly 'cursor.png' inside your Downloads folder."
    fi
    ;;
  * )
    echo "Operation cancelled. No changes made."
    ;;
esac
