CC = icc
CFLAGS = -std=c99 -Wall -O3
LDFLAGS = -lm

jacobi: jacobi.c
	$(CC) $(CFLAGS) -o jacobi jacobi.c $(LDFLAGS)

profiled: jacobi.c
	$(CC) $(CFLAGS) -o jacobi jacobi.c -pg $(LDFLAGS)
