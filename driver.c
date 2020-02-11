#include <stdio.h>
#include <string.h>
#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */


void rperm(unsigned long *r, unsigned long n) {
  unsigned long i, j, t;
  for(i = 0; i < n; i++) r[i]=i+1;
 
  // now do random swapping of r[i] with r[j]
  srand(time(NULL));
  if (n > 1) {
    for (i = 0; i < n - 1; i++) {
      j = i + rand() / (RAND_MAX / (n - i) + 1);
      t = r[j];
      r[j] = r[i];
      r[i] = t;
    }
  }
}

int asm_main(int,char**);

int main(int argc,char** argv) {
  int ret_status;
  ret_status = asm_main(argc,argv);
  return ret_status;
}
