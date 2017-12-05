files="jacobi_*.out"
regex="Solver runtime = ([0-9]+.[0-9]+) seconds"

echo cat $files | grep -Eo $regex | cut -d ' ' -f 4