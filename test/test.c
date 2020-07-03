#include <stdio.h>

int main() {
  FILE *fp;

  fp = fopen("test.txt", "w");
  fprintf(fp, "Hello, world!\n");
  fclose(fp);
  return 0;
}
