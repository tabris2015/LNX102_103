#!/bin/bash

fecha="$(date +%e)_$(date +%m)_$(date +%Y)"
temp_folder="/tmp/"

# crear archivos para transferir
for n in 1 2; do
    touch "$temp_folder${fecha}_$n.txt"
done 

usuarios=(ftpuser1 ftpuser2 ftpuser3)

for usuario in ${usuarios[@]}; do
    echo "Transfiriendo archivos del usuario $usuario"
done
# limpiar archivos
