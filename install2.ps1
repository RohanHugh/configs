# Define the URL for the Notepad++ installer (32-bit version, as it's smaller)
$notepadUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.7/npp.8.4.7.Installer.exe"

# Define the location where the installer will be saved
$installerPath = "$env:TEMP\npp_installer.exe"

# Download the Notepad++ installer
Invoke-WebRequest -Uri $notepadUrl -OutFile $installerPath

# Run the installer silently (no user interaction)
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Remove the installer after installation
Remove-Item -Path $installerPath

Write-Host "Notepad++ has been installed successfully."
