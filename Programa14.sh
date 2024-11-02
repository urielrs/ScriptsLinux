echo "Hola"
echo "Escribe la mac para denegar"
read x

iptables -D INPUT -p tcp -m mac --mac-source $x --dport 22 -j DROP
