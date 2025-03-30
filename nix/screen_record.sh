#!/bin/env bash

# Generate filename
dateTime=$(date +%Y-%m-%d_%H-%M-%S)
output_file="$HOME/Videos/$dateTime.mp4"

# If wf-recorder is running, stop it
pgrep -x "wf-recorder" \
    && pkill -INT -x wf-recorder \
    && notify-send -h string:wf-recorder:record -t 5000 "Finished Recording" "File $output_file" \
    && exit 0

# Start recording
notify-send -h string:wf-recorder:record -t 1000 "Recording Started"
# INFO: add `-a` flag to capture mic
wf-recorder -g "$(slurp)" --codec libx264 --pixel-format yuv420p --crf 18 -f "$output_file"
