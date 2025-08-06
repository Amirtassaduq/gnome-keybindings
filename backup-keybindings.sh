#!/bin/bash

# === CONFIG ===
DEST_DIR="$HOME/dotfiles/keyboard"
REPO_DIR="$HOME/dotfiles"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Create backup directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Backup GNOME keybindings
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$DEST_DIR/media-keys.dconf"
dconf dump /org/gnome/desktop/wm/keybindings/ > "$DEST_DIR/wm-keybindings.dconf"
dconf dump /org/gnome/shell/extensions/pop-shell/ > "$DEST_DIR/pop-shell-keybindings.dconf"

# Go to repo and commit changes
cd "$REPO_DIR" || exit

# Add only changed files
#git add -u "$DEST_DIR"
git add .

# Commit with timestamp
git commit -m "🧠 Backup keyboard shortcuts: $DATE"

# Push to remote
git push
