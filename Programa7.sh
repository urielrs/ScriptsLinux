echo "selecciona una opcion" 
echo "1) Si vienes de otra escuela"
echo "2)si inicias clases en Julio"
read p
echo "elige tu carrera"
echo "1 ING Industrial"
echo "2 InG TIC"
echo "3 ING Sistemas"
echo "4 ING Mecatronica"
echo "5 ING Quimica"
echo "6 Lic Administracion"
echo "7 ING Civil"
echo "8 ING Logistica"
read c
a=$(date +%y)
echo "ingresa tu numero de alumno"
read n
if [ $p -gt  0 ]  && [ $p -le 2 ]
then 
if [ $c -gt  0 ]  && [ $c -le 8 ]
then
if [ $n -gt 0 ] && [ $n -le 9 ]
then
echo  "20"$a$p$c"00"$n
else if [ $n -gt 9 ] && [ $n -le 99 ]
then
echo "20"$a$p$c"0"$n
else if [ $n -ge 100 ]  &&  [ $n -le 999 ]
then
echo "20"$a$p$c$n 
fi
fi
fi
fi
fi
