#pragma once

#include <stdint.h>

#define CHUNK_SIZE 4096

typedef struct eta_arena_chunk_t {
  struct eta_arena_chunk_t *next;
  uint8_t data[CHUNK_SIZE];
  uint64_t used;
} eta_arena_chunk_t;

eta_arena_chunk_t *eta_arena_chunk_create();
void eta_arena_chunk_destroy(eta_arena_chunk_t *chunk);

typedef struct {
  eta_arena_chunk_t *first;
  eta_arena_chunk_t *current;
} eta_arena_t;

void eta_arena_init(eta_arena_t *arena);
void eta_arena_free(eta_arena_t *arena);