#!/bin/zsh

set -e

for f in *.ogg; do
  out=$(echo $f | sed -e "s/.ogg/.mp3/g")
  echo "Processing: $f"
  ffmpeg -i "$f" -acodec libmp3lame "$out"
  echo "Saved: $out"
done