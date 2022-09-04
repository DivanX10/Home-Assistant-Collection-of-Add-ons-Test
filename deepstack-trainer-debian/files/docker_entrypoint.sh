#!/bin/bash

set -e

#exec /usr/bin/python3 trainer.py &
#exec /usr/bin/python3 run.py

#exec python3 trainer.py &
#exec python3 run.py

python3 trainer.py &
python3 run.py
