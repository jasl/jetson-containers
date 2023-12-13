#!/usr/bin/env bash

pip3 show exllamav2 && python3 -c 'import exllamav2'

cd /opt/exllamav2

python3 test_inference.py --help
