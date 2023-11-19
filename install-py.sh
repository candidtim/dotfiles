#!/bin/bash

pushd ~/app
python3 -m venv pylsp
./pylsp/bin/pip install python-lsp-server
popd

echo "alias pylsp=~/app/pylsp/bin/pylsp" > ~/.shlocal
