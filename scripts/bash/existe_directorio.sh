#!/bin/bash

if [ -d "$1" ]; then
    echo "el directorio $1 existe!"
else
    echo "el directorio $1 NO existe!"
fi
