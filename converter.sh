#!/usr/bin/env bash

shopt -s nullglob

if [[ ! -d output ]]; then
    mkdir output
fi

for file in ./*.png; do
    output_name=$(basename -s .png "${file}")
    convert "${file}" -define jpeg:extent=1Mb "output/${output_name}.jpg"
done

for file in ./*.jpg; do
    output_name=$(basename -s .jpg "${file}")
    convert "${file}" -define jpeg:extent=1Mb "output/${output_name}.jpg"
done
