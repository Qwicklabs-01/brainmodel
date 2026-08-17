# build_model.ps1
Write-Host "Pulling the stronger base model (llama3.2) from Ollama..."
ollama pull llama3.2

Write-Host "Building Brain Model from Modelfile..."
ollama create brain-model -f Modelfile

Write-Host "Done! You can now run the model using: ollama run brain-model"
