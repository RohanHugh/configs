# Get the path to the user's Downloads folder
$downloadsFolder = [System.Environment]::GetFolderPath('MyDocuments') + "\Downloads"

# Define the path for the new test.txt file
$filePath = "$downloadsFolder\test.txt"

# Create and write some content to test.txt
"Hello, this is a test file!" | Out-File -FilePath $filePath

# Confirm that the file has been created
Write-Host "File test.txt has been created in the Downloads folder at $filePath"
