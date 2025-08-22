package eta_control

import "core:mem"
import "core:strings"

Span :: struct {
	file:  Index,
	range: [2]u64,
}

Source :: struct {
	content:  string,
	filename: string,
}

init_source :: proc(content: string, filename: string) -> (Source, mem.Allocator_Error) {
	content_copy, content_err := strings.clone(content)
	if content_err != nil {
		return Source{}, content_err
	}

	filename_copy, filename_err := strings.clone(filename)
	if filename_err != nil {
		delete(content_copy)
		return Source{}, filename_err
	}
	return Source{content = content_copy, filename = filename_copy}, nil
}

deinit_source :: proc(src: ^Source) {
	delete(src.content)
	delete(src.filename)
	src.content = ""
	src.filename = ""
}

//TODO: use persistent arena
Manager :: struct {
	sources: Index_Set(Source),
}

init_manager :: proc() -> Manager {
	return Manager{sources = init_index_set(Source)}
}

deinit_manager :: proc(mgr: ^Manager) {
	for &src in mgr.sources.values {
		deinit_source(&src)
	}
	//TODO: cleanup hashmap too
	deinit_index_set(Source, &mgr.sources)
}
