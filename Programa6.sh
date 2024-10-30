echo "Captura un numero"
read x
echo "Dame otro numero"
read z
if [ $x -gt $z ]
then 
echo "El numero mayor es" $x
else 
echo "El numero mayor es" $z
fi



echo "Introduce el nombre del trabajador:"
read nombre

echo "Introduce la dirección del trabajador:"
read direccion

echo "Introduce el puesto del trabajador:"
read puesto

echo "Introduce el sueldo semanal del trabajador:"
read sueldo_semanal

echo "Introduce los días trabajados:"
read dias_trabajados

echo "Introduce las horas extras trabajadas:"
read horas_extras

# Calcular el pago de horas extras
if [ $horas_extras -le 8 ]; then
    pago_horas_extras=$(echo "$horas_extras * ($sueldo_semanal / (7 * 8)) * 2" | bc -l)
else
    pago_horas_dobles=$(echo "8 * ($sueldo_semanal / (7 * 8)) * 2" | bc -l)
    horas_extras_restantes=$(echo "$horas_extras - 8" | bc)
    pago_horas_triples=$(echo "$horas_extras_restantes * ($sueldo_semanal / (7 * 8)) * 3" | bc -l)
    pago_horas_extras=$(echo "$pago_horas_dobles + $pago_horas_triples" | bc -l)
fi

# Calcular el sueldo total
sueldo_total=$(echo "$sueldo_semanal + $pago_horas_extras" | bc -l)

# Calcular deducciones
if (( $(echo "$sueldo_total <= 2500" | bc -l) )); then
    deduccion_1=$(echo "$sueldo_total * 0.06" | bc -l)
else
    deduccion_1=$(echo "$sueldo_total * 0.07" | bc -l)
fi

if (( $(echo "$sueldo_total <= 3000" | bc -l) )); then
    deduccion_2=$(echo "$sueldo_total * 0.03" | bc -l)
else
    deduccion_2=$(echo "$sueldo_total * 0.04" | bc -l)
fi

total_deducciones=$(echo "$deduccion_1 + $deduccion_2" | bc -l)
total_neto=$(echo "$sueldo_total - $total_deducciones" | bc -l)

# Mostrar resultados
echo "Nombre del trabajador: $nombre"
echo "Dirección del trabajador: $direccion"
echo "Puesto del trabajador: $puesto"
echo "Sueldo semanal: $sueldo_semanal"
echo "Días trabajados: $dias_trabajados"
echo "Horas extras trabajadas: $horas_extras"
echo "Total a pagar de horas extras: $pago_horas_extras"
echo "Total a pagar (sueldo normal + horas extras): $sueldo_total"
echo "Deducción 1 (6% o 7%): $deduccion_1"
echo "Deducción 2 (3% o 4%): $deduccion_2"
echo "Total de deducciones: $total_deducciones"
echo "Total neto a pagar: $total_neto"
