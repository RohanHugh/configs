# Define the URL for the Google Chrome installer
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"

# Define the location to save the installer
$installerPath = "$env:TEMP\chrome_installer.exe"

# Download the Google Chrome installer
Invoke-WebRequest -Uri $chromeUrl -OutFile $installerPath

# Run the installer with admin privileges (elevated)
Start-Process -FilePath $installerPath -ArgumentList "/silent" -Verb RunAs -Wait

# Remove the installer after installation
Remove-Item -Path $installerPath

Write-Host "Google Chrome has been installed successfully."
