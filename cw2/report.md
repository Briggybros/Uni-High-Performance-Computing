# HPC Report 2 - Gregory Sims - gs15687 #

## Starting configuration ##

The starting configuration from the serial coursework achieves the following times, added here as a reference:
| Size | Iterations | Error    | Solver Time (s) |
|------|------------|----------|-----------------|
| 2000 | 5479       | 0.099972 | 4.078155        |
| 4000 | 10040      | 0.199882 | 45.478557       |

## Parallelise loop over rows ##

A comment should be made about the variance of the recorded times. I took 20 samples of the time the code with the parallel for loop takes to run with a size of 4000. The range of the results was on the scale of a second and the variance was 0.056305. Because of this unreliability, recorded times will be averages with their variance given. I would suspect this inconsistency is due to load on blue crystal or kernel throttling on some of the cores.

I first used OpenMP to paralellise the for loop which iterates over the rows of the matrix. This approach is typical of a loop level, or fine grain, parallel pattern; However, if this code were extended to work across nodes, then I suspect a task farm pattern would be more effective.

| Size | Iterations | Error    | Solver Time (s) | Variance |
|------|------------|----------|-----------------|----------|
| 2000 | 5479       | 0.099972 | 0.510614        | 0.042909 |
| 4000 | 10040      | 0.199880 | 17.653278       | 0.377585 |

This change causes an increase in performance because each row in the jacobi iteration is independent; meaning that the computation on any given row does not affect any other row. This in turn means that each row can be computed at the same time in parallel, instead of waiting for the previous row to complete as in the serial version.

## Paralellising for loop over columns ##

The inner for loop, which loops over the columns, cannot be paralellised because the row variable cannot exist in more than one OpenMP scope.

## Reducing the convergence check ##

The loop which checks for convergence is also independent with respect to the rows, so it could be merged into the initial loop above. However, doing this naively will cause errors due to multiple threads entering the critical region at once when trying to change the sqdiff variable. To counter this, the OpenMP reduction pragma can be used. This pragma collects all of the results from the loop and applies a reduction to safely perform the addition.

| Size | Iterations | Error    | Solver Time (s) | Variance  |
|------|------------|----------|-----------------|-----------|
| 2000 | 5479       | 0.099972 | 0.448745        | 0.050865  |
| 4000 | 10040      | 0.199880 | 19.460619       | 10.303102 |
