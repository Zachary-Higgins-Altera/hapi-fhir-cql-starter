$baseUrl = "http://localhost:8080/fhir"
Get-ChildItem -Path ".\ecqm-content-cms-2025\input\resources\library" -Filter *.json | ForEach-Object {
    Write-Host "Uploading $($_.Name)..."
    $body = Get-Content $_.FullName -Raw
    Invoke-RestMethod -Uri "$baseUrl/Library" `
                      -Method Post `
                      -ContentType "application/fhir+json" `
                      -Body $body
}
