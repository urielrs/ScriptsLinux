echo "Hola"
echo "Escribe la ip para denegar"
read x

iptables -A INPUT -p icmp -s $x -j DROP
