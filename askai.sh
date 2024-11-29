#!/bin/bash
source askai_env/bin/activate
if [ $# -eq 0 ]; then
    echo "Usage: ./askai \"Your prompt here\""
    exit 1
fi


PROMPT="$*"

python3 main.py "$PROMPT"

deactivate
