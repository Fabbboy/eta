package eta

import "core:fmt"

import "eta:lexer"
import "eta:control"

main :: proc() {
    span := control.Span {
        file = control.Index { value = 1 },
        range = {10, 20}
    }

    token := lexer.Token {
        kind = lexer.Token_Kind.Error,
        lexeme = "example",
        span = span,
    }

    fmt.printf("Eta token: %v\n", token)
}