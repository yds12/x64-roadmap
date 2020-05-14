#include <stdio.h>
#include <inttypes.h>

uint64_t asm_func();

int main() {
  uint64_t result = asm_func();
  printf("%" PRIu64 "\n", result);
  printf("%" PRIx64 "\n", result);
  return 0;
}
