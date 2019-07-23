#!/bin/bash

if [ -f "$1" ]; then
    echo "el archivo $1 existe!"
else
    echo "el archivo $1 NO existe!"
fi
