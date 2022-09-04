#!/bin/bash
exec python3 /opt/trainer/trainer.py &
exec python3 /opt/trainer/scripts/backup.py
