# HPC Report 2 - Gregory Sims - gs15687 #

## Starting configuration ##

The starting configuration from the serial coursework achieves the following times, added here as a reference:
| Size | Iterations | Error    | Solver Time (s) |
|------|------------|----------|-----------------|
| 1000 | 2957       | 0.099972 | 0.587112        |
| 2000 | 5479       | 0.099972 | 4.078155        |
| 4000 | 10040      | 0.199882 | 45.478557       |

## Parallelize loop over rows ##

A comment should be made about the variance of the recorded times. I took 20 samples of the time the code with the parallel for loop takes to run with a size of 4000. The range of the results was on the scale of a second and the variance was 0.056305. Because of this unreliability, recorded times will be averages with their variance given. I would suspect this inconsistency is due to load on blue crystal or kernel throttling on some of the cores.

I first used OpenMP to parallelize the for loop which iterates over the rows of the matrix. This approach is typical of a loop level, or fine grain, parallel pattern; However, if this code were extended to work across nodes, then I suspect a task farm pattern would be more effective.

| Size | Iterations | Error    | Solver Time (s) | Variance |
|------|------------|----------|-----------------|----------|
| 1000 | 2957       | 0.050049 | 0.176385        | 0.001835 |
| 2000 | 5479       | 0.099972 | 0.452219        | 0.025781 |
| 4000 | 10040      | 0.199880 | 17.588596       | 0.056305 |

This change causes an increase in performance because each row in the jacobi iteration is independent; meaning that the computation on any given row does not affect any other row. This in turn means that each row can be computed at the same time in parallel, instead of waiting for the previous row to complete as in the serial version.

## Parallelizing other loops ##

Both other for loops in the run function cannot be paralellized. The inner for loop, which loops over the columns, cannot be paralellized because the row variable cannot exist in more than one OpenMP scope. The loop which is used for checking convergence doesn't seem to be paralellized as doing so causes fluctuations in the iterations and the solution error.