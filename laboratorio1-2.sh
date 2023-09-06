#!/bin/bash


function group_permissions()
{
	echo "EL USUARIO $USER SE AGREGARÁ AL GRUPO $GROUP."
	sudo adduser $USER $GROUP
	echo "EL USUARIO DEFAULT SE AGREGARÁ AL GRUPO $GROUP."
	user_default=$(grep :$(id -u): /etc/passwd | cut -d: -f1)
	sudo adduser $user_default $GROUP
	echo "SE LE DARÁN PERMISOS DE EJECUACIÒN AL GRUPO $GROUP SOBRE EL ARCHIVO laboratorio1.sh"
	sudo chown :$GROUP laboratorio1.sh
	sudo chmod 676 laboratorio1.sh
	echo "AHORA SOLO EL GRUPO $GROUP TIENE PERMISO DE EJECUACIÒN SOBRE EL ARCHIVO laboratorio1.sh"
}



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
        echo "USUARIO CREADO."
else
        echo "USUARIO YA EXISTE."

fi



read -p "INGRESE EL NOMBRE DEL GRUPO: " GROUP

mapfile -t GRUPOS < <(cut -d: -f1 /etc/group)
found=0

for group in "${GRUPOS[@]}"
do
	if [ $GROUP == $group ]; then
                found=1
                break
        fi

done

if [ $found -eq 0 ]; then
        sudo groupadd $GROUP
        echo "GRUPO CREADO."
else
        echo "GRUPO YA EXISTE."

fi

group_permissions

