package eta_lexer 

import "eta:control"

Token_Kind :: enum {
    Error
}

Token :: struct {
    kind: Token_Kind,
    lexeme: string,
    span: control.Span
}