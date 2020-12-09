#!/usr/bin/env pwsh

# Add-Type -AssemblyName System.Windows.Forms

# $FileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
#     InitialDirectory = [Environment]::GetFolderPath('Desktop') 
#     Filter           = 'Do'
# }

# $null = $FileBrowser.ShowDialog()

function Install-ImageMagick {
    $url = 'https://imagemagick.org/download/binaries/ImageMagick-7.0.10-34-Q16-HDRI-x64-dll.exe'
    $outPath = Join-Path(Get-Location.Path "imagemagick_installer.exe")
    Invoke-WebRequest -Uri $url -OutFile $outPath
    Start-Process -FilePath $outPath
}

if (!(Get-Command "convert" -ErrorAction SilentlyContinue)) {
    Install-
}

if (!(Test-Path $(Join-Path "." "/output"))) {
    New-Item -ItemType Directory -Path "./output"
}

Get-ChildItem "." -Filter *.png | ForEach-Object {
    convert $_.FullName -define jpeg:extent=1Mb $(Join-Path "output" "$($_.BaseName).jpg")
}

Get-ChildItem "." -Filter *.jpg | ForEach-Object {
    convert $_.FullName -define jpeg:extent=1Mb $(Join-Path "output" "$($_.BaseName).jpg")
}
