#!/bin/bash
echo "hello world $1, es un gusto"

# numero total de archivos en un directorio
function total_files {
        find $1 -type f | wc -l
}
folder=/home/pepe/Documents
echo $(total_files $folder) 

num_a=2
num_b=3

if [ $num_a -lt $num_b ]; then
    echo "$num_a es menor que $num_b!"
fi


if [ $num_a -lt $num_b ]; then
    echo "$num_a es menor que $num_b!"
else
    echo "$num_a es mayor que $num_b!"
fi


for i in $(cat lista.txt); do
    echo $i
done


counter=0
while [ $counter -lt 3 ]; do
    let counter+=1
    echo $counter
done


