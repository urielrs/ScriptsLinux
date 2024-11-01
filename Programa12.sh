echo "Hola"
echo "Escribe el puerto para denegar"
read x

echo "Escribe la ip para denegar"
read y

iptables -A INPUT -p tcp -s $y --dport $x -j DROP
