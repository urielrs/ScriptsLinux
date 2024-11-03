echo "hola"

echo "Selecciona una opcion"
echo "1.- Checar estado de las tres reglas"
echo "2.- salir"

read x
if [ $x -eq 1 ]
then
iptables -nL
else
exit
fi
