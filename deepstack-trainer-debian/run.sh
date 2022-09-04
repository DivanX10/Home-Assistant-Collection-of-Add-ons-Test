#!/bin/bash
set -e

exec /usr/bin/python3 trainer.py &
exec /bin/sh -c /opt/trainer/backup.sh
