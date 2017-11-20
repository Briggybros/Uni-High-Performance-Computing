CC = icc
CFLAGS = -std=c11 -Wall -O3 -fast -axSSSE3 -fopenmp
LDFLAGS = -lm

jacobi: jacobi.c
	$(CC) $(CFLAGS) -o jacobi jacobi.c $(LDFLAGS)

profiled: jacobi.c
	$(CC) $(CFLAGS) -o jacobi jacobi.c -pg $(LDFLAGS)
