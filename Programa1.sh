echo "Dime un numero"
read x
echo "Dime otro numero" 
read z
r=`expr $x \+ $z`
echo "El resultado es" $r
