#!/bin/bash

n_archivos=$(find $1 -type f | wc -l)

if [ -z $n_archivos ]; then
    echo "el directorio $1 NO tiene archivos"
else
    echo "el directorio$ $1 tiene $n_archivos archivos"
fi
