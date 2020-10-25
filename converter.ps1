#!/usr/bin/env pwsh

if (!(Test-Path $(Join-Path "." "/output"))) {
    New-Item -ItemType Directory -Path "./output"
}

Get-ChildItem "." -Filter *.png | ForEach-Object {
    convert $_.FullName -define jpeg:extent=1Mb $(Join-Path "output" "$($_.BaseName).jpg")
}

Get-ChildItem "." -Filter *.jpg | ForEach-Object {
    convert $_.FullName -define jpeg:extent=1Mb $(Join-Path "output" "$($_.BaseName).jpg")
}
