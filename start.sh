#!/bin/bash

# Check if the model exists
if [ ! -f models/model.tar.gz ]; then
    echo "No existing model found. Training a new model..."
    rasa train
elif [ "$(find data config.yml domain.yml -type f -newer models/model.tar.gz | wc -l)" -gt 0 ]; then
    echo "Model out of date. Fine-tuning the model..."
    rasa train --finetune
else
    echo "Model is up to date. No training or fine-tuning needed."
fi

# Use the RASA_DEBUG_LEVEL environment variable if provided
DEBUG_FLAG=${RASA_DEBUG_LEVEL:-""}

# Start the Rasa server
rasa run --enable-api --cors "*" $DEBUG_FLAG
