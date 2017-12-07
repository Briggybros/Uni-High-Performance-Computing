# HPC Report 2 - Gregory Sims - gs15687 #
## Starting configuration ##
The starting configuration from the serial coursework achieves the following times, added here as a reference:
| Size | Iterations | Error    | Solver Time (s) |
|------|------------|----------|-----------------|
| 1000 | 2957       | 0.099972 | 0.587112        |
| 2000 | 5479       | 0.099972 | 4.078155        |
| 4000 | 10040      | 0.199882 | 45.478557       |

## Parallelize loop over rows ##

A comment should be made about the variance of the recorded times. I took 20 samples of the time the code with the parrallel for loop takes to run with a size of 4000. The range of the results was on the scale of a second and the variance was 0.056305. Because of this unreliablility all times from this point onwards will be averages with their variance given. I would suspect this inconsistency is due to load on blue crystal or kernel throttling on some of the cores.

I first used OpenMP to parallelize the for loop which iterates over the rows of the matrix.

| Size | Iterations | Error    | Solver Time (s) | Variance |
|------|------------|----------|-----------------|----------|
| 1000 | 2957       | 0.050049 | 0.267605        | 0.010438 |
| 2000 | 5479       | 0.099972 | 0.452219        | 0.025781 |
| 4000 | 10040      | 0.199880 | 17.588596       | 0.056305 |

This change causes an increase in performace because each row in the jacobi itteration is independent; meaning that the computation on any given row does not affect any other row. This in turn means that each row can be computed at the same time in parallel, instead of waiting for the previous row to complete as in the serial version.

## Parallelize loop over columns ##

I then attempted to parallelize the loop which iterates over the columns of each row. This should not cause any logical complications as the loop only increments a shared variable based on some conditions. Since addition is commutative, there is no scope for race conditions to occur.

