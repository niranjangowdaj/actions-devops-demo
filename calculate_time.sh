#!/bin/bash

current_time_utc=$(date -u +"%Y-%m-%d %H:%M:%S")

target_time_utc=$(date -u -d "$(date -u +%Y-%m-%d) 12:30:00" +"%Y-%m-%d %H:%M:%S")

if [[ $(date -u +%s) -gt $(date -u -d "$target_time_utc" +%s) ]]; then
  target_time_utc=$(date -u -d "$(date -u +%Y-%m-%d) 12:30:00 + 1 day" +"%Y-%m-%d %H:%M:%S")
fi

current_seconds=$(date -u -d "$current_time_utc" +%s)
target_seconds=$(date -u -d "$target_time_utc" +%s)
diff_seconds=$((target_seconds - current_seconds))

hours=$((diff_seconds / 3600))
minutes=$(( (diff_seconds % 3600) / 60 ))

echo "Time remaining until 6 PM IST: $hours hours and $minutes minutes"