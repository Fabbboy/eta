package eta_control

import "core:mem"

Arena_Chunk :: struct($SIZE: u64) {
	next: ^Arena_Chunk(SIZE),
	data: [SIZE]u8,
    used: u64,  
}

init_arena_chunk :: proc($SIZE: u64, allocator: mem.Allocator) -> (^Arena_Chunk(SIZE), mem.Allocator_Error) {
    chunk, chunk_err := make(^Arena_Chunk(SIZE), allocator)
    if chunk_err != nil {
        return nil, chunk_err
    }
    return chunk, nil   
}



Arena :: struct($SIZE: u64 = 4096) {
    head: ^Arena_Chunk(SIZE),
    current: ^Arena_Chunk(SIZE),
    backing: mem.Allocator,
}

