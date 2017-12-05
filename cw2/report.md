# HPC Report 2 - Gregory Sims - gs15687 #
## Starting configuration ##
The starting configuration from the first part of the coursework achieves the following times:
| Size | Iterations | Error    | Solver Time (s) |
|------|------------|----------|-----------------|
| 1000 | 2957       | 0.099972 | 0.587112        |
| 2000 | 5479       | 0.099972 | 4.078155        |
| 4000 | 10040      | 0.199882 | 45.478557       |

## Parallelize outer for loop ##

At this point, a comment should be made about the variance of the recorded times. I took 20 samples of the time the code with the parrallel for loop takes to run with a size of 4000. The range of the results was on the scale of a second and the variance was 0.056305. Because of this unreliablility all times from this point onwards will be averages with their variance given. I would suspect this inconsistency is due to load on blue crystal or kernel throttling on some of the cores.

| Size | Iterations | Error    | Solver Time (s) | Variance |
|------|------------|----------|-----------------|----------|
| 1000 | 2957       | 0.050049 | 0.267605        | 0.010438 |
| 2000 | 5479       | 0.099972 | 0.452219        | 0.025781 |
| 4000 | 10040      | 0.199880 | 17.588596       | 0.056305 |

