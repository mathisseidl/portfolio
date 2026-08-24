#!/bin/bash
set -e
FFMPEG="/c/Users/mathi/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0-full_build/bin/ffmpeg.exe"
DIR="$(dirname "$0")/../assets/video"
cd "$DIR"

compress() {
  local src="$1"; local out="$2"; local scale="$3"
  echo "== $src -> $out =="
  "$FFMPEG" -y -i "$src" \
    -map 0:v:0 -map 0:a:0? \
    -vf "scale=${scale}" -r 30 \
    -c:v libx264 -preset slow -crf 23 -profile:v high -pix_fmt yuv420p \
    -c:a aac -b:a 128k \
    -movflags +faststart \
    "$out"
}

compress "Warehouse_Robot_Demo.mov.MOV" "warehouse-robot-demo.mp4" "-2:720"
compress "Cart_Demo.mov.mov" "cart-demo.mp4" "-2:720"
compress "Siemens_Demo.mov.mov" "siemens-demo.mp4" "-2:720"
compress "Connect4_Demo.mov.mov" "connect4-demo.mp4" "-2:720"
compress "Color_Sorter_Demo.mov.mov" "color-sorter-demo.mp4" "720:-2"
compress "Ultrasonic_Sensor_Demo.mov.MOV" "ultrasonic-sensor-demo.mp4" "-2:720"

echo "Done."
ls -la *.mp4
