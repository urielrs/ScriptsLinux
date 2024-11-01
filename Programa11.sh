echo "Hola Mundo"
echo "Dame el rango inical"
read x
echo "Dame el rango final"
read y
iptables -A INPUT -p tcp --dport 22 -m iprange --src-range $x-$y -j DROP
