package eta_control

import "core:mem"

Span :: struct {
	file:  Index,
	range: [2]u64,
}

Source :: struct {
	content:  string,
	filename: string,
}

//TODO: use persistent arena
Manager :: struct {
	sources: Index_Set(Source),
}

init_manager :: proc() -> Manager {
	return Manager{sources = init_index_set(Source)}
}

deinit_manager :: proc(mgr: ^Manager) {
	deinit_index_set(Source, &mgr.sources)
}
