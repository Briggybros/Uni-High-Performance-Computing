# HPC Report 2 - Gregory Sims - gs15687 #
## Starting configuration ##
The starting configuration from the first part of the coursework achieves the following times:
| Size | Iterations | Error    | Solver Time (s) |
|------|------------|----------|-----------------|
| 1000 | 2957       | 0.099972 | 0.587112        |
| 2000 | 5479       | 0.099972 | 4.078155        |
| 4000 | 10040      | 0.199882 | 45.478557       |

## Parallelize outer for loop ##

At this point, a comment should be made about the variance of the recorded times. I took 20 samples of the time the code with the parrallel for loop takes to run with a size of 4000. The

| Size | Iterations | Error    | Solver Time (s) |
|------|------------|----------|-----------------|
| 1000 | 2957       | 0.050049 | 0.210690        |
| 2000 | 5479       | 0.099972 | 0.402967        |
| 4000 | 10040      | 0.199880 | 17.588596       |

