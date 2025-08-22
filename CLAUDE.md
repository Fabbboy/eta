# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Eta is a lazily evaluated meta-build system written in Odin. The project allows users to describe their build processes declaratively, taking inspiration from Nix and Haskell. The system itself is bootstrapped using its own build configuration.

## Build Commands

This project uses `just` as the primary build tool. The available commands are:

- `just build` - Compiles the Eta executable using the Odin compiler
- `just clean` - Removes the generated executable
- `just run` - Builds and runs the Eta executable

Eta cannot yet build it self

## Development Environment

- **Language**: Odin programming language
- **Compiler**: Requires the Odin compiler to be installed and available in PATH (or set via `ODIN` environment variable)
- **Output**: Generates `eta.exe` executable in the project root

## Code Architecture

The codebase is organized into packages:

- `eta:main` - Entry point and main application logic
- `eta:lexer` - Tokenization and lexical analysis
  - Defines `Token` struct with kind, lexeme, and span information
  - Currently minimal with only `Error` token kind defined
- `eta:control` - Source code control structures
  - Defines `Index` and `Span` types for tracking source locations

The project uses Odin's package system with collections, where the `eta` collection maps to the `eta/` source directory.

## Key Files

- `build.eta` - The project's own build configuration written in Eta syntax
- `justfile` - Traditional build commands using just
- `eta/main.odin` - Application entry point
- `eta/lexer/` - Lexical analysis components
- `eta/control/` - Source tracking utilities