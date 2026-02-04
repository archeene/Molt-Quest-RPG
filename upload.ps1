$imagePath = ".\logo-temp.jpg"
$imageBytes = [System.IO.File]::ReadAllBytes($imagePath)
$base64Image = [Convert]::ToBase64String($imageBytes)

$payload = @{
    image = "data:image/jpeg;base64,$base64Image"
    name = "moltrpg-logo"
} | ConvertTo-Json

Write-Host "Uploading logo to Clawnch..."

$response = Invoke-RestMethod -Uri "https://clawn.ch/api/upload" -Method POST -ContentType "application/json" -Body $payload

Write-Host "Upload complete!"
Write-Host $response

# Save the URL to a file
$response.url | Out-File -FilePath ".\logo-url.txt"
Write-Host "Logo URL saved to logo-url.txt"
