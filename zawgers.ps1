Start-Process win32calc

$Data = @{
WallpaperURL = "https://wallpaperaccess.com/full/2842458.jpg" # Change to your fitting
LockscreenURL = "https://wallpapercave.com/wp/7NtVM9X.jpg" # Change to your fitting
DownloadDirectory = "C:\temp"
RegKeyPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP' # Assigns the wallpaper
StatusValue = "1"
}
$WallpaperDest = $($Data.DownloadDirectory + "\Wallpaper." + ($Data.WallpaperURL -replace ".*\."))
$LockscreenDest = $($Data.DownloadDirectory + "\Lockscreen." + ($Data.LockscreenUrl -replace ".*\."))
# Creates the destination folder on the target computer
New-Item -ItemType Directory -Path $Data.DownloadDirectory -ErrorAction SilentlyContinue
# Downloads the image file from the source location
Start-BitsTransfer -Source $Data.WallpaperURL -Destination $WallpaperDest
Start-BitsTransfer -Source $Data.LockscreenUrl -Destination $LockscreenDest
New-Item -Path $Data.RegKeyPath -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty -Path $Data.RegKeyPath -Name 'DesktopImageStatus' -Value $Data.Statusvalue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $Data.RegKeyPath -Name 'LockScreenImageStatus' -Value $Data.Statusvalue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $Data.RegKeyPath -Name 'DesktopImagePath' -Value $WallpaperDest -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $Data.RegKeyPath -Name 'DesktopImageUrl' -Value $WallpaperDest -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $Data.RegKeyPath -Name 'LockScreenImagePath' -Value $LockscreenDest -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $Data.RegKeyPath -Name 'LockScreenImageUrl' -Value $LockscreenDest -PropertyType STRING -Force | Out-Null
