# Settings
TEX_FILE="$1"
OUTPUT_FILE="$2"
RESOLUTION=600

if [ -z "$TEX_FILE" ]; then
  echo "입력 파일명이 필요합니다."
  exit 1
fi

if [ -z "$OUTPUT_FILE" ]; then
  OUTPUT_FILE="${TEX_FILE%.*}.png"
fi

# Tex 2 DVI
latex "$TEX_FILE"

# DVI 2 PNG
dvipng -T tight -bg Transparent -D "$RESOLUTION" -o "$OUTPUT_FILE" "${TEX_FILE%.*}.dvi"

# 중간 파일 정리 (선택사항)
rm "${TEX_FILE%.*}.aux" "${TEX_FILE%.*}.dvi" "${TEX_FILE%.*}.log"
