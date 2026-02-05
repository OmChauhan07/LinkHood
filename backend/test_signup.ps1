$body = @{
    name = "Test User"
    email = "testuser_ssl_" + (Get-Random) + "@example.com"
    password = "password123"
    phone = "555" + (Get-Random)
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "http://localhost:5000/api/users/signup" -Method Post -ContentType "application/json" -Body $body -ErrorAction Stop
    Write-Host "Success! Response:"
    Write-Host ($response | ConvertTo-Json -Depth 2)
} catch {
    Write-Host "Error Request Failed"
    Write-Host $_.Exception.Message
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $respBody = $reader.ReadToEnd()
        Write-Host "Server Response: $respBody"
    }
}
