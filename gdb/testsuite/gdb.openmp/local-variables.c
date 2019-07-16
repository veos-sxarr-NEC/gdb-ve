/* Companion code for local-variables.exp.  */
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

void
collatz_orbit()
{
  int i = 0, l = 0;
  #pragma omp parallel for private(i) lastprivate(l) num_threads(4)
  for (i = 2; i < 6; ++i) 
    {
      int n = i;
      while (n != 1)
	{
          n = n % 2 ? (n*3)+1 : n / 2;
	}
      printf("Reached %d.\n", n); // post-collatz
      l = i;
    }
    printf("Last %d.\n", l); // post-parallel-for
}

int
main (int argc, char *argv[])
{
  int nthreads, tid, x;
  x = 40;
  #pragma omp parallel private(tid) firstprivate(x) shared(nthreads) num_threads(4)
    {
      tid = omp_get_thread_num();
      x = x + tid;
      printf("Thread = %d (x = %d)\n", tid, x);

      if (tid == 0)
	{
	  nthreads = omp_get_num_threads();
	  printf("Number of threads = %d\n", nthreads);
	}

      #pragma omp barrier
      printf("post barrier tag = %d\n", x); // post-barrier-marker
    }

  collatz_orbit();

  return 0;
}
