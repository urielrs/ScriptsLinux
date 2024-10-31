echo "Dame un numero"
read z
b=1
while [ $b -le $z ]
do
c=1
while [ $c -le $z ]
do
d=1
while [ $d -le $z ]
do
e=`expr $b \* $b`
f=`expr $c \* $c`
g=`expr $d \* $d`
h=`expr $f \+ $g`
if [ $e -eq $h ]
then
echo $e "=" $f "+" $g
d=`expr $d \+ 1`
else
d=`expr $d \+ 1`
fi
done
c=`expr $c \+ 1`
done
b=`expr $b \+ 1`
done
