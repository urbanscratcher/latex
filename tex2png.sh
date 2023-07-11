# Settings
TEX_FILE="$1"
OUTPUT_FILE="${TEX_FILE%.*}.png"
RESOLUTION=600
DVI_OR_PDF="$2"

if [ -z "$TEX_FILE" ]; then
  echo "입력 파일명이 필요합니다."
  exit 1
fi

if [ "$DVI_OR_PDF" == "dvi" ]; then
  # Tex 2 DVI
  latex "$TEX_FILE"

  # DVI 2 PNG
  dvipng -T tight -bg Transparent -D "$RESOLUTION" -o "$OUTPUT_FILE" "${TEX_FILE%.*}.dvi"
else
  pdflatex "$TEX_FILE"
  convert -density 600 "${TEX_FILE%.*}.pdf" "$OUTPUT_FILE"
fi

# 중간 파일 삭제
rm "${TEX_FILE%.*}.pdf" "${TEX_FILE%.*}.aux" "${TEX_FILE%.*}.dvi" "${TEX_FILE%.*}.log"
