# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ETA is a lazily evaluated meta-build system that allows you to describe build processes declaratively. The project is inspired by Nix and Haskell and is currently in early development.

## Architecture

The project consists of:
- **Build system core** (C implementation): `eta/main.c` - Currently minimal, just contains an empty main function
- **Build definition language**: `build.eta` - Contains the declarative build configuration using a functional language syntax
- **Traditional build fallback**: `Makefile` - Standard C compilation setup

The `build.eta` file demonstrates the intended meta-build system syntax:
- Uses functional programming concepts with `let` bindings and functions
- Defines build steps as Rules that can be executed and produce artifacts
- Supports lazy evaluation and dependency management
- Imports builtin functions for system integration

## Common Development Commands

### Building
```bash
# Build using Make (current working method)
make build

# Clean build artifacts
make clean

# Build and run
make run

# Verbose build output
make V=1 build
```

### Project Structure
- `eta/` - Source code directory (C implementation)
- `out/` - Build output directory
- `build.eta` - Meta-build system definition

## Build System Details

The current implementation uses a hybrid approach:
1. **Makefile**: Provides immediate C compilation functionality using clang
2. **build.eta**: Defines the future meta-build system that will replace traditional build tools

The `build.eta` file shows the intended architecture where:
- `eta_step` defines build rules with commands and file dependencies
- `eta_artifact` wraps build steps into executable artifacts
- The system supports lazy evaluation and dependency tracking

## Development Notes

- The project uses clang as the default C compiler
- Debug symbols are enabled (`-g` flag)
- No package.json exists - this is a C project with a custom build system definition
- The main C source is minimal, suggesting the project is in early development