#!/bin/bash

read -p "Ingrese el nombre del archivo: " NOMBRE

if [ -e $NOMBRE ]; then
	echo "El archivo existe."
	PERMISOS=$(ls -l $NOMBRE)
else
	echo "El archivo no existe."

fi


function get_permissions_verbose()
{

	DUENO=${PERMISOS:1:3}
		if [ ${DUENO:0:1} == r ]; then
			echo "El dueno tiene permiso para leer este archivo."
		else
                        echo "El dueno no tiene permiso para leer este archivo."
		fi
		if [ ${DUENO:1:1} == w ]; then
                        echo "El dueno tiene permiso para editar este archivo."
		else
                        echo "El dueno no tiene permiso para editar este archivo."
		fi
		if [ ${DUENO:2:2} == x ]; then
                        echo "El dueno tiene permiso para ejecutar este archivo."
		else
                        echo "El dueno no tiene permiso para ejecutar este archivo."
		fi
	GRUPO=${PERMISOS:4:3}
		if [ ${GRUPO:0:1} == r ]; then
                        echo "El grupo tiene permiso para leer este archivo."
                else
                        echo "El grupo no tiene permiso para leer este archivo."
                fi
                if [ ${GRUPO:1:1} == w ]; then
                        echo "El grupo tiene permiso para editar este archivo."
                else
                        echo "El grupo no tiene permiso para editar este archivo."
                fi
                if [ ${GRUPO:2:2} == x ]; then
                        echo "El grupo tiene permiso para ejecutar este archivo."
                else
                        echo "El grupo no tiene permiso para ejecutar este archivo."
                fi

        OTROS=${PERMISOS:7:3}
		if [ ${OTROS:0:1} == r ]; then
                        echo "Otros usuarios tienen permiso para leer este archivo."
                else
                        echo "Otros usuarios no tienen permiso para leer este archivo."
                fi
                if [ ${OTROS:1:1} == w ]; then
                        echo "Otros usuarios tienen permiso para editar este archivo."
                else
                        echo "Otros usuarios no tienen permiso para editar este archivo."
                fi
                if [ ${OTROS:2:2} == x ]; then
                        echo "Otros usuarios tienen permiso para ejecutar este archivo."
                else
                        echo "Otros usuarios no tienen permiso para ejecutar este archivo."
                fi


}

get_permissions_verbose
