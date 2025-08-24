#pragma once

#include <stddef.h>

typedef struct {
  void *ptr;
  size_t size;
} eta_slice_t;

static inline eta_slice_t eta_make_slice(void *ptr, size_t size) {
  eta_slice_t slice;
  slice.ptr = ptr;
  slice.size = size;
  return slice;
}