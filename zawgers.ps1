# Define variables
$firefoxPortableUrl = "https://portableapps.com/apps/internet/firefox_portable"
$destinationPath = "$HOME\Downloads\FirefoxPortable.zip"
$installPath = "$HOME\Programs\FirefoxPortable"

# Create installation directory if it doesn't exist
if (-Not (Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force
    Write-Output "Created directory: $installPath"
}

# Download the portable Firefox zip
Write-Output "Downloading Firefox Portable..."
Invoke-WebRequest -Uri $firefoxPortableUrl -OutFile $destinationPath

# Extract the zip file
Write-Output "Extracting Firefox Portable..."
Expand-Archive -Path $destinationPath -DestinationPath $installPath -Force

# Clean up the downloaded zip file
Write-Output "Cleaning up..."
Remove-Item -Path $destinationPath -Force

# Inform the user of successful installation
Write-Output "Firefox Portable has been installed at $installPath."
