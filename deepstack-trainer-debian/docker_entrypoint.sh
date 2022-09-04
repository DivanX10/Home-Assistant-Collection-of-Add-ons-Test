#!/bin/bash

set -e

exec python3 trainer.py &
exec python3 backup.py 