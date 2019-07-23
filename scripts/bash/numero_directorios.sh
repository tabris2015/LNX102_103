#!/bin/bash

n_directorios=$(find $1 -type d | wc -l)

if [ -z $n_directorios ]; then
    echo "el directorio $1 NO tiene directorios"
else
    echo "el directorio$ $1 tiene $n_directorios directorios"
fi
