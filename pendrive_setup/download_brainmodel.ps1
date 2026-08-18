Write-Host "Downloading a lightweight AI model (TinyLlama - ~637 MB)..."
Write-Host "This will be saved as 'brainmodel.gguf' so it works perfectly with your bat file!"
Write-Host "Please wait, this might take a few minutes depending on your internet speed..."

$modelUrl = "https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf"
$destination = "$PSScriptRoot\brainmodel.gguf"

try {
    Invoke-WebRequest -Uri $modelUrl -OutFile $destination
    Write-Host ""
    Write-Host "Success! The model has been downloaded and saved as 'brainmodel.gguf'."
    Write-Host "You are now fully ready to copy this folder to your pen drive!"
} catch {
    Write-Host ""
    Write-Host "An error occurred while downloading: $_"
}

Write-Host ""
Write-Host "Press any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
