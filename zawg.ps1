# Set the URL for the Notepad++ MSI installer
$installerUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/latest/download/npp.8.5.8.Installer.x64.msi"  # Replace with the latest version if needed

# Define the path to save the downloaded MSI
$outputFile = "$env:USERPROFILE\Downloads\nppInstaller.msi"

# Download the MSI installer
Write-Output "Downloading Notepad++ installer..."
Invoke-WebRequest -Uri $installerUrl -OutFile $outputFile

# Check if the file was downloaded successfully
if (Test-Path $outputFile) {
    Write-Output "Download complete. Running the installer..."
    
    # Start the MSI installer
    Start-Process msiexec.exe -ArgumentList "/i $outputFile /quiet" -Wait

    Write-Output "Installation process has been started."
} else {
    Write-Output "Failed to download the installer."
}
