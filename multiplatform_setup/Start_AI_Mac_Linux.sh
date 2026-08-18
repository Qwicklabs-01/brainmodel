#!/bin/bash
echo "========================================="
echo "Starting Portable AI on Mac / Linux..."
echo "========================================="

# Change to the directory where this script is located
cd "$(dirname "$0")"

# Ensure the binary has execution permissions
chmod +x ./llama-cli

# Run the model
./llama-cli -m "brainmodel.gguf" -c 2048 -n 512 --color -i
