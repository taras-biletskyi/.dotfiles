#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.dotfiles/fedora/wallpaper"

# Extract current wallpaper, assumes it is the same for all monitors
CURRENT_WALLPAPER=$(swww query | awk -F 'image: ' '{print $2}' | head -n 1)

# Loop until a different wallpaper is chosen
while true; do
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    [[ $RANDOM_WALLPAPER != "$CURRENT_WALLPAPER" ]] && break
done

echo "Setting wallpaper to $RANDOM_WALLPAPER"
DIRECTIONS=(left right top bottom wipe wave center outer)
CHOICE="${DIRECTIONS[RANDOM % ${#DIRECTIONS[@]}]}"
swww img "$RANDOM_WALLPAPER" --transition-type "$CHOICE" --transition-fps 100 --transition-step 50
