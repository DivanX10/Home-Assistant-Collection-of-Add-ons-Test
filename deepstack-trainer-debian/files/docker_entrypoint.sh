#!/bin/bash

set -e

exec /usr/bin/python3 trainer.py &&
exec /usr/bin/python3 run.py 