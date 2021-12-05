#!/bin/bash

#Almacenamos el número del mes actual en el que estamos.
mes=$(date +%m)

#Buscamos el número del mes en el que estamos dentro del case y este nos devolverá el mensaje correspondiente.
case $mes in

2) echo "El mes tiene 28 días.";;
4 | 6 | 9 | 11) echo "El mes tiene 30 días.";;
1 | 3 | 5 | 7 | 8 | 10 | 12) echo "El mes tiene 31 días. ";;

esac