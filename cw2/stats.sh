#!/bin/bash

mapfile -t times < <(cat $1 | grep "Solver runtime" | cut -d ' ' -f4)

sum=0
sqsum=0
min=100
max=0

for i in `seq 0 $(expr ${#times[@]} - 1)`; do
        if [${times[i]} -lt $min]
        then
                min=${times[i]}
        fi

        if [${times[i]} -gt $max]
        then
                max=${times[i]}
        fi

        sum=$(bc -l <<< "$sum + ${times[i]}")
        sqsum=$(bc -l <<< "$sqsum + (${times[i]} * ${times[i]})")
done

expected=$(bc -l <<< "$sum / ${#times[@]}")
expected2=$(bc -l <<< "$sqsum / ${#times[@]}")

variance=$(bc -l <<< "$expected2 - ($expected * $expected)")

sd=$(bc -l <<< "sqrt($variance)")

echo "Average: $expected"
echo "Variance: $variance"
echo "Standard Deviation: $sd"
echo "Min: $min"
echo "Max: $max"
echo "Range: $(bc -l <<< "$max - $min")"

rm $1