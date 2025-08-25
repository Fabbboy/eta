#include "muc/memory/allocator.h"
#include "muc/memory/callocator.h"
#include "muc/memory/layout.h"
#include "muc/option.h"
#include <stdio.h>

int main() {
  muc_allocator_t gpa = muc_callocator();
  MUC_OPTION_NAME(ptr_t) buf = muc_allocate(gpa, MUC_LAYOUT(int));
  if (!MUC_OPTION_METHOD(ptr_t, is_some)(buf)) {
    printf("Allocation failed\n");
    return 1;
  }

  *buf.value = 123;
  printf("Allocated integer: %d\n", *buf.value);
  muc_deallocate(gpa, buf.value, MUC_LAYOUT(int));
}
