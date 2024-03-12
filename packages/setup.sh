#!/bin/bash

git clone https://github.com/emscripten-core/emsdk
cd emsdk
./emsdk install 3.1.52
./emsdk activate 3.1.52
source ./emsdk_env.sh
cd ..

git clone https://github.com/garrettgu10/pyodide.git
(cd pyodide; git checkout langchain)
ln -s pyodide/packages packages

# rust is required for building some wheels
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

sudo apt install -y pkg-config

sudo apt install gfortran sqlite3 f2c swig libreadline-dev

#todo: setup python3.12

python3.12 -m venv .venv
source .venv/bin/activate
pip install pyodide-build==0.26.0a3

pip install boto3 cython
