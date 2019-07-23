#!/bin/bash

# obtener una lista de usuarios

# verificar si existe el directorio backups, si no existe crearlo
backup_folder="/tmp/backups"
backups_data="$backup_folder/backups_data"

echo "Verificando que exista el directorio de backups"
if [ -d "$backup_folder" ]; then
    echo "El directorio existe"
else
    echo "El directorio NO existe, creando..."
    mkdir -p /tmp/backups/backups_data
fi


users=$( ls /home )

# para cada usuario en la lista

for user in $users; do
    echo "========================="
    echo "Procesando usuario: $user"
    echo "========================="
    # verificar el ultimo backup
    backup_data_file="${backups_data}/${user}_last_backup.log"
    last_n_files=0
    last_n_dirs=0
    if [ -f "$backup_data_file" ]; then
        echo "el archivo existe!"
        # leer el contenido
        content=($( cat $backup_data_file )) #convertir una lista a un array bash
        last_n_files=${content[0]}
        last_n_dirs=${content[1]}
        
    else
        echo "El archivo NO existe, creando..."
        # crear archivos
        touch $backup_data_file
        echo "$last_n_files" >> $backup_data_file
        echo "$last_n_dirs" >> $backup_data_file
    fi
    echo "Ultimo backup: $last_n_files archivos y $last_n_dirs carpetas"
    # obtener numero de archivos actuales
    user_dir="/home/$user"
    n_files=$(find $user_dir -type f | wc -l)
    n_dirs=$(find $user_dir -type d | wc -l)
    echo "Encontrados $n_files archivos y $n_dirs carpetas"

    if [ $n_files -ne $last_n_files ] || [ $n_dirs -ne $last_n_dirs ]; then
        # hay diferencia entre el numero de archivos o carpetas
        # comprimir carpeta
        backup_file="$backup_folder/${user}_$( date +%s ).tar"
        echo "Realizando backup... [$backup_file]"
        
    else 
        echo "No hay cambios, backup innecesario"
    fi
done


