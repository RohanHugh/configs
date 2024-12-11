# Define variables
$downloadUrl = "https://portableapps.com/redirect/?a=FirefoxPortable&s=fc&d=1"  # Direct link to Firefox Portable installer
$destinationPath = "$HOME\Downloads\FirefoxPortableInstaller.exe"
$installPath = "$HOME\Programs\FirefoxPortable"

# Create the installation directory if it doesn't exist
if (-Not (Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force
    Write-Output "Created directory: $installPath"
}

# Download the portable Firefox installer
Write-Output "Downloading Firefox Portable..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath -ErrorAction Stop

# Verify if the installer was downloaded successfully
if (-Not (Test-Path -Path $destinationPath)) {
    Write-Error "Failed to download the Firefox Portable installer. Please check the URL or your network connection."
    exit
}

# Run the installer
Write-Output "Running the Firefox Portable installer..."
Start-Process -FilePath $destinationPath -ArgumentList "/DIR=$installPath", "/VERYSILENT", "/NORESTART" -Wait

# Verify if Firefox Portable was installed successfully
if (Test-Path -Path "$installPath\FirefoxPortable.exe") {
    Write-Output "Firefox Portable has been installed successfully at $installPath."
} else {
    Write-Error "Installation failed. Please check the installer or permissions."
}

# Clean up the downloaded installer
Write-Output "Cleaning up..."
Remove-Item -Path $destinationPath -Force -ErrorAction SilentlyContinue

# Final message
Write-Output "Setup complete!"
