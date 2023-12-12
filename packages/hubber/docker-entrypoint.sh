#!/usr/bin/env bash

set -e

cd /root

echo "Starting JupyterLab @ http://$(hostname -I | cut -d' ' -f1):8888 (password nvidia)"
echo "JupterLab logging location:  /var/log/jupyter.log  (inside the container)"

# jupyter lab --ip 0.0.0.0 --port 8888 --allow-root "$@" >> /var/log/jupyter.log 2>&1

jupyter lab --ip 0.0.0.0 --port 8888 --allow-root &> /var/log/jupyter.log &
exec "$@"
