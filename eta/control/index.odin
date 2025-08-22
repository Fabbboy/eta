package eta_control

import "core:mem"

Index :: struct {
	value: u64,
}

Index_Set :: struct($T: typeid) {
	values: [dynamic]T,
	table:  map[T]Index,
}

init_index_set :: proc($T: typeid) -> Index_Set(T) {
	return Index_Set(T){values = make([dynamic]T), table = make(map[T]Index)}
}

deinit_index_set :: proc($T: typeid, set: ^Index_Set(T)) {
	delete(set.values)
	delete(set.table)
	set.values = nil
	set.table = nil
}
