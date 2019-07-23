#!/bin/bash

ftp -nvi <<!EOF
    open 192.168.0.155
    user admin cognos123
    binary
    cd cognos
    get 1.txt
    get 2.txt
    get 3.txt
    cd textos
    mget *.txt
    bye
    !EOF