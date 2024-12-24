Write-Host "Executing"

# Disable Enhance Pointer Precision
$regPath = "HKCU:\Control Panel\Mouse"
$regValue = "MouseSpeed"

# Set registry value to disable Enhance Pointer Precision
Set-ItemProperty -Path $regPath -Name $regValue -Value 0