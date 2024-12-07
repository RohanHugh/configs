# Define the URL for the latest Firefox installer
$firefoxUrl = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"

# Define the location where the installer will be saved
$installerPath = "$env:TEMP\FirefoxSetup.exe"

# Download the Firefox installer
Invoke-WebRequest -Uri $firefoxUrl -OutFile $installerPath

# Run the installer silently (no user interaction)
Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait

# Remove the installer after installation
Remove-Item -Path $installerPath

Write-Host "Firefox has been installed successfully."
