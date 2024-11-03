echo "Hola"
echo "Escribe el puerto para permitir"
read x

echo "Escribe la ip"
read y

iptables -D INPUT -p tcp -s $y --dport $x -j DROP
