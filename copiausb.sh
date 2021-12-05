#!/bin/bash

if [ $# -eq 1 2>/dev/null ]
then 

    #Lo primero que hará el script será intentar crear el comprimido en el directorio pasado como parámetro y le pondrá automáticamente un nombre con su fecha. Si el usuario comete algún error descartará los mensajes de error.
    sudo tar -czf $1/copia_scripts_$(date +%d:%m:%Y).gz ./*.sh 2>/dev/null

    #Comprueba si se ha producido algún error. Si no lo ha hecho mostrará un mensaje indicando que el comprimido se ha efectuado satisfactoriamente en la ruta elegida.
    if [ $? -eq 0 ] 
    then

        echo "Comprimido creado satisfactoriamente en $1"

    #Si hay algún error se lo indicará al usuario.
    else

    echo "Ruta no válida. Asegurese de haber escrito corretamente la ruta y de tener permisos de escritura sobre el directorio elegido."

    fi
else

    echo "ERROR. Por favor introduzca una ruta válida."

fi