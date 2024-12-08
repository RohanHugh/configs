Start-Process win32calc

# Define variables
$imageUrl = "https://github.com/rh609/setup/blob/main/black.png" # Replace with the raw URL to your image
$tempFile = "$env:TEMP\black.png"

# Download the image
try {
    Invoke-WebRequest -Uri $imageUrl -OutFile $tempFile -ErrorAction Stop
    Write-Host "Image downloaded successfully to $tempFile"
} catch {
    Write-Error "Failed to download image. $_"
    exit 1
}

# Set the image as the desktop background
try {
    # Using COM object to set the background
    $comObject = New-Object -ComObject WScript.Shell
    $comObject.RegWrite("HKCU\Control Panel\Desktop\Wallpaper", $tempFile)

    # Refresh the desktop to apply the wallpaper
    rundll32.exe user32.dll,UpdatePerUserSystemParameters
    Write-Host "Wallpaper successfully set!"
} catch {
    Write-Error "Failed to set wallpaper. $_"
    exit 1
}
