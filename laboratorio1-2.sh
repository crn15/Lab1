#!/bin/bash

read -p "INGRESE EL NOMBRRE DEL USUARIO: " USER

USERS=$(ls /home)
exist=0

for user in $USERS
do
        if [ $USER == $user ]; then
                exist=1
                break
        fi
done

if [ $exist -eq 0 ]; then
        sudo useradd -m $USER
        echo "Usuario creado."
else
        echo "El usuario ya existe."

fi



read -p "INGRESE EL NOMBRE DEL GRUPO: " GROUP

GROUPS=$(cat /etc/group)
existe=0
echo $GROUPS

for group in $GROUPS
do
        if [ $GROUP == $group ]; then
                existe=1
                break
        fi
done

if [ $existe -eq 0 ]; then
        sudo groupadd  $GROUP
        echo "Grupo creado."
else
        echo "El Grupo ya existe."

fi

