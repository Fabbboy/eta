package eta

import "core:fmt"

import "eta:control"
import "eta:lexer"

main :: proc() {
	span := control.Span {
		file = control.Index{value = 1},
		range = {10, 20},
	}

	token := lexer.Token {
		kind   = lexer.Token_Kind.Error,
		lexeme = "example",
		span   = span,
	}

	manager := control.init_manager()
	defer control.deinit_manager(&manager)

	fmt.printf("Eta token: %v\n", token)
}
