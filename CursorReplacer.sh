#!/bin/bash

# The correct path to Roblox textures
UI_DIR="/Applications/Roblox.app/Contents/Resources/content/textures/Cursors/KeyboardMouse"
BACKUP_DIR="/Downloads"

# The correct path to YOUR Documents folder
FIND_DIR="$HOME/Downloads"

if [ ! -d "$BACKUP_DIR/backupCursor" ]; then
    echo "Backup doesnt exist."
    echo "Making now!"
    mkdir "$BACKUP_DIR/backupCursor"
    # rm -rf "$BACKUP_DIR/backupCursor"
fi

read -p "Enter your name: " continuerun

if [ ! -v continuerun ]; then
  echo "well, crap"
  else
    # Running the copy commands
    sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowFarCursor.png"
    sudo cp "$FIND_DIR/cursor.png" "$UI_DIR/ArrowCursor.png"
    
    echo "--- Finished! Restart Roblox to see changes. ---"
fi
