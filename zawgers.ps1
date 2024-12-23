# Define the URL for Firefox Portable download and the directory to install
$firefoxPortableUrl = "https://portableapps.com/apps/internet/firefox_portable"
$downloadDir = "$env:USERPROFILE\Downloads\FirefoxPortable"

# Create the download directory if it doesn't exist
if (-not (Test-Path -Path $downloadDir)) {
    New-Item -ItemType Directory -Path $downloadDir
}

# Path for the downloaded file
$downloadFilePath = "$downloadDir\FirefoxPortable.exe"

# Download Firefox Portable installer
Write-Host "Downloading Firefox Portable..."
Invoke-WebRequest -Uri $firefoxPortableUrl -OutFile $downloadFilePath

# Extract the downloaded file (assuming it's an EXE installer that extracts the files)
Write-Host "Extracting Firefox Portable..."
Start-Process -FilePath $downloadFilePath -ArgumentList "/S" -Wait

# Optionally, remove the installer after installation
Remove-Item -Path $downloadFilePath

Write-Host "Firefox Portable has been installed successfully in $downloadDir"
