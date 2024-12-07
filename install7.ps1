# Function to check if Notepad++ is installed
function Check-NotepadPlusPlus {
    $notepadPlusPlusPath = "C:\Program Files\Notepad++\notepad++.exe"
    if (Test-Path $notepadPlusPlusPath) {
        Write-Host "Notepad++ is already installed." -ForegroundColor Green
        return $true
    } else {
        Write-Host "Notepad++ is not installed." -ForegroundColor Red
        return $false
    }
}

# Function to install Notepad++
function Install-NotepadPlusPlus {
    $url = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.7/npp.8.4.7.Installer.exe"
    $installerPath = "$env:TEMP\npp_installer.exe"

    Write-Host "Downloading Notepad++ installer..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $url -OutFile $installerPath

    Write-Host "Installing Notepad++..." -ForegroundColor Yellow
    Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

    Remove-Item -Path $installerPath
    Write-Host "Notepad++ has been installed successfully." -ForegroundColor Green
}

# Function to display the menu
function Show-Menu {
    Clear-Host
    Write-Host "===============================" -ForegroundColor Cyan
    Write-Host "      Notepad++ Installer      " -ForegroundColor Cyan
    Write-Host "===============================" -ForegroundColor Cyan
    Write-Host "1. Check if Notepad++ is installed"
    Write-Host "2. Install Notepad++"
    Write-Host "3. Exit"
    Write-Host "===============================" -ForegroundColor Cyan
    Write-Host "Choose an option (1-3):"
}

# Main loop to navigate through options
while ($true) {
    Show-Menu
    $userChoice = Read-Host

    switch ($userChoice) {
        "1" {
            # Check if Notepad++ is installed
            Check-NotepadPlusPlus
        }
        "2" {
            # Install Notepad++
            if (-not (Check-NotepadPlusPlus)) {
                Install-NotepadPlusPlus
            }
        }
        "3" {
            # Exit the script
            Write-Host "Exiting... Have a great day!" -ForegroundColor Green
            break
        }
        default {
            Write-Host "Invalid option. Please choose a valid option (1-3)." -ForegroundColor Red
        }
    }
    
    # Pause and wait for user input to continue
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
