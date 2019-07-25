#!/bin/bash
host="192.168.0.155"
user1="ftpuser1"

function tx_ftp(){
    ftp -nvi <<EOF
    open $1
    user $2 $2
    binary
    put $3
    put $4
    bye
EOF
}

# tx_ftp $host $user1 /tmp/1.log /tmp/2.log

fecha="$(date +%e)_$(date +%m)_$(date +%Y)"
temp_folder="/tmp/"
archivos=()

# crear archivos para transferir
for n in 1 2; do
    touch "$temp_folder${fecha}_$n.txt"
    archivos+=("${fecha}_$n.txt")
    echo "${fecha}_$n.txt"
done 

usuarios=(ftpuser1 ftpuser2 ftpuser3)

for usuario in ${usuarios[@]}; do
    echo "Transfiriendo archivos del usuario $usuario"
    # ingresando a la carpeta temporal
    cd $temp_folder
    # transferir archivos 
    tx_ftp $host $usuario ${archivos[0]} ${archivos[1]}
done
# limpiar archivos
