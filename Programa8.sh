echo "Ingresa tu nombre"
read nombre

echo "Ingresa la direccion"
read direccion

echo "Ingresa el puesto"
read puesto

echo "Ingresa el sueldo semanal"
read sueldo_semanal

echo "Ingresa los dias trabajados"
read dias_trabajados

echo "Ingresa las horas extras trabajadas"
read horas_extras


if [ $dias_trabajados -lt 7 ]; then
    sueldo_semanal=$(echo "scale=2; ($sueldo_semanal / 7) * $dias_trabajados" | bc -l)
fi


if [ $horas_extras -le 8 ]; then
    pago_horas_extras=$(echo "$horas_extras * ($sueldo_semanal / (7*8)) * 2" | bc -l)
else
    pago_horas_dobles=$(echo "8 * ($sueldo_semanal / (7*8)) * 2" | bc -l)
    horas_extras_restantes=$(echo "$horas_extras - 8" | bc)
    pago_horas_triples=$(echo "$horas_extras_restantes * ($sueldo_semanal / (7*8)) * 3" | bc -l)
    pago_horas_extras=$(echo "$pago_horas_dobles + $pago_horas_triples" | bc -l)
fi


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

cuota_sindical=$(echo "$sueldo_total * 0.02" | bc -l)


total_deducciones=$(echo "$deduccion_1 + $deduccion_2 + $cuota_sindical" | bc -l)


total_neto=$(echo "$sueldo_total - $total_deducciones" | bc -l)


echo "Total a pagar de horas extras: $pago_horas_extras"
echo "Total a pagar (sueldo normal + horas extras): $sueldo_total"
echo "ISPT: $deduccion_1"
echo "IMSS: $deduccion_2"
echo "Cuota sindical: $cuota_sindical"
echo "Total de deducciones: $total_deducciones"
echo "Total a pagar: $total_neto"
