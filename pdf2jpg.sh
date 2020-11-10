#!/bin/bash

# Script to convert PDF file to JPG images
#
# Dependencies:
# * ghostscript
# * imagemagick

for PDF in "$@"
do
  PDF=$1

  echo "Processing $PDF..."
  DIR=`basename "$1" .pdf`

  mkdir "$DIR"

  gs -dAutoRotatePages=/None -sDEVICE=pdfwrite -o "$DIR"/%04d.pdf "$PDF"

  for i in "$DIR"/*.pdf; do
    convert -colorspace RGB -trim -density 300 -quality 100 "$i" "$DIR"/`basename "$i" .pdf`.jpg
  done
done
