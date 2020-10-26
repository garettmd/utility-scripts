#!/usr/bin/env pwsh

# Add-Type -AssemblyName System.Windows.Forms

# $FileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
#     InitialDirectory = [Environment]::GetFolderPath('Desktop') 
#     Filter           = 'Do'
# }

# $null = $FileBrowser.ShowDialog()

if (!(Test-Path $(Join-Path "." "/output"))) {
    New-Item -ItemType Directory -Path "./output"
}

Get-ChildItem "." -Filter *.png | ForEach-Object {
    convert $_.FullName -define jpeg:extent=1Mb $(Join-Path "output" "$($_.BaseName).jpg")
}

Get-ChildItem "." -Filter *.jpg | ForEach-Object {
    convert $_.FullName -define jpeg:extent=1Mb $(Join-Path "output" "$($_.BaseName).jpg")
}
