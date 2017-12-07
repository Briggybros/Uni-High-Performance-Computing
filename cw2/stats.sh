#!/bin/bash

mapfile -t times < <(cat $1 | grep "Solver runtime" | cut -d ' ' -f4)

sum=0
sqsum=0

for i in `seq 0 $(expr ${#times[@]} - 1)`; do
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

rm $1