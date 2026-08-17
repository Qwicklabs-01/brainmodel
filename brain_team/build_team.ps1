Write-Host "Pulling base model llama3.2..."
ollama pull llama3.2

Write-Host "Building Brain SEO..."
ollama create brainseo -f Modelfile.seo

Write-Host "Building Brain Task Manager..."
ollama create braintaskmanager -f Modelfile.taskmanager

Write-Host "Building Brain Socialist..."
ollama create brainsocialist -f Modelfile.socialist

Write-Host "Building Brain Managing..."
ollama create brainmanaging -f Modelfile.managing

Write-Host "Building Brain Automation..."
ollama create brainautomation -f Modelfile.automation

Write-Host "Building Brain Design..."
ollama create braindesign -f Modelfile.design

Write-Host "Building Brain Coder..."
ollama create braincoder -f Modelfile.coder

Write-Host "Building Brain Writer..."
ollama create brainwriter -f Modelfile.writer

Write-Host "Building Brain Analyst..."
ollama create brainanalyst -f Modelfile.analyst

Write-Host "Building Brain Tutor..."
ollama create braintutor -f Modelfile.tutor

Write-Host "Building Brain Terminal..."
ollama create brainterminal -f Modelfile.terminal
ollama create brainomnipro -f Modelfile.omnibrainpro

Write-Host ""
Write-Host "Brain Team Mega-Roster successfully built! You now have 12 elite AI personas." -ForegroundColor Green
Write-Host "You can now chat with them by running: ollama run <modelname>"
