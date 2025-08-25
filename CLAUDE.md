# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ETA is a lazily evaluated meta-build system that allows you to describe build processes declaratively. The project is inspired by Nix and Haskell and is currently in early development.

## Architecture

The project consists of:
- **Build system core** (C implementation): `eta/main.c` - Currently minimal empty main function
- **Memory management**: `eta/arena.h` and `eta/arena.c` - Arena allocator with chunked memory management
- **Build definition language**: `build.eta` - Demonstrates the intended declarative build syntax using functional programming concepts
- **Dependencies**: Uses the `muc` library (included as subproject)

The `build.eta` file shows the intended meta-build system syntax:
- Uses functional programming with `let` bindings and function definitions
- Defines build steps as Rules that execute commands and produce artifacts  
- Currently targets Odin language compilation but the C implementation will interpret this
- Supports lazy evaluation and dependency management through builtin functions

## Common Development Commands

### Building
```bash
# Build using Meson
meson setup builddir
meson compile -C builddir

# Install the executable
meson install -C builddir

# Clean build artifacts
rm -rf builddir
```

### Project Structure
- `eta/` - C source code (main.c, arena implementation, utils.h)
- `build.eta` - Meta-build system definition demonstrating the target language
- `subprojects/muc/` - Memory utilities and common functionality library
- `meson.build` - Build configuration (C11 standard, warning level 3)

## Build System Details

The project uses Meson as the build system with:
- C11 standard compliance
- Warning level 3 for strict compilation
- Dependency on `muc` library for memory management utilities
- The `muc` subproject provides allocators, options, and platform abstractions

The arena allocator (`eta/arena.h`) implements chunked memory management:
- 4KB chunks with linked list structure
- Tracks current and first chunks for efficient allocation
- Designed for the meta-build system's memory needs