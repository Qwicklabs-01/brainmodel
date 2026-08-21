Write-Host "=========================================="
Write-Host " Ollama Model Extractor for Pen Drive "
Write-Host "=========================================="
Write-Host ""

$ollamaPath = "$env:USERPROFILE\.ollama\models\manifests\registry.ollama.ai\library"
$blobsPath = "$env:USERPROFILE\.ollama\models\blobs"

if (-not (Test-Path $ollamaPath)) {
    Write-Host "Ollama models not found at $ollamaPath. Are you sure Ollama is installed?"
    pause
    exit
}

$models = Get-ChildItem -Path $ollamaPath -Directory | Select-Object -ExpandProperty Name

if ($models.Count -eq 0) {
    Write-Host "No models found in Ollama."
    pause
    exit
}

Write-Host "Available Models in Ollama:"
for ($i = 0; $i -lt $models.Count; $i++) {
    Write-Host "$($i + 1). $($models[$i])"
}

Write-Host ""
$choice = Read-Host "Enter the number of the model you want to copy to your pen drive"
$index = [int]$choice - 1

if ($index -lt 0 -or $index -ge $models.Count) {
    Write-Host "Invalid selection."
    pause
    exit
}

$selectedModel = $models[$index]
Write-Host "Extracting $selectedModel..."

# Try to find the manifest file
$manifestPath = "$ollamaPath\$selectedModel\latest"
if (-not (Test-Path $manifestPath)) {
    $tags = Get-ChildItem -Path "$ollamaPath\$selectedModel" -File
    if ($tags.Count -gt 0) {
        $manifestPath = $tags[0].FullName
    } else {
        Write-Host "Manifest not found for $selectedModel."
        pause
        exit
    }
}

$json = Get-Content $manifestPath | ConvertFrom-Json
$modelLayer = $json.layers | Where-Object { $_.mediaType -eq "application/vnd.ollama.image.model" }

if (-not $modelLayer) {
    Write-Host "Could not find the model layer in the manifest."
    pause
    exit
}

$digest = $modelLayer.digest -replace ":", "-"
$blobFile = "$blobsPath\$digest"

if (Test-Path $blobFile) {
    $destination = "$PSScriptRoot\$selectedModel.gguf"
    Write-Host "Found model blob! Copying to $destination ..."
    Write-Host "(Please wait, this will take a while since the file is multi-gigabyte)..."
    
    Copy-Item -Path $blobFile -Destination $destination -Force
    
    Write-Host ""
    Write-Host "Success! The model has been exported as '$selectedModel.gguf'."
    Write-Host "Important: Open your Start_AI script (e.g. Start_AI_Windows.bat) and edit it"
    Write-Host "to use '$selectedModel.gguf' instead of 'brainmodel.gguf'."
} else {
    Write-Host "Error: Could not find the blob file at $blobFile."
}

Write-Host ""
pause
