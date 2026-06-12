# PowerShell cleanup script to remove auth feature
# This script deletes the entire auth folder from the features directory

Write-Host "Removing auth feature..." -ForegroundColor Yellow

# Get the auth folder path
$authPath = "lib/features/auth"

# Check if the folder exists
if (Test-Path $authPath) {
    # Remove the folder and all its contents
    Remove-Item -Path $authPath -Recurse -Force
    Write-Host "Auth feature removed successfully!" -ForegroundColor Green
    Write-Host "The app is now ready to run with only the Todo feature." -ForegroundColor Green
} else {
    Write-Host "Auth folder not found at $authPath" -ForegroundColor Red
}
