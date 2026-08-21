Write-Host "Fetching the latest llama.cpp release for Windows..."

try {
    $releaseUrl = "https://api.github.com/repos/ggerganov/llama.cpp/releases/latest"
    $release = Invoke-RestMethod -Uri $releaseUrl
    $asset = $release.assets | Where-Object { $_.name -match "win-avx2-x64.zip$" }

    if ($asset) {
        Write-Host "Found release: $($asset.name)"
        $zipPath = "$PSScriptRoot\llama.zip"
        Write-Host "Downloading (this might take a minute)..."
        Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zipPath
        
        Write-Host "Extracting..."
        Expand-Archive -Path $zipPath -DestinationPath $PSScriptRoot -Force
        
        Write-Host "Cleaning up..."
        Remove-Item $zipPath
        
        Write-Host ""
        Write-Host "Done! You should now see 'llama-cli.exe' (and some other files) in this folder."
        Write-Host "You can safely delete the extra .exe files if you only need llama-cli.exe."
    } else {
        Write-Host "Could not find the appropriate Windows release asset."
    }
} catch {
    Write-Host "An error occurred while downloading: $_"
}

Write-Host ""
Write-Host "Press any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
