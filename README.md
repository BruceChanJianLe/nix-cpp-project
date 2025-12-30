# A Nix Flake for C++ Development Environment

> This project provides a reproducible development environment containing the
> latest versions of GCC, Clang, and CMake using Nix Flakes. By using this,
> you ensure that every developer on your team uses the exact same compiler
> versions and build tools, regardless of their operating system.

## 🛠 Tools Included

- GCC: The GNU Compiler Collection.
- Clang: The LLVM compiler front-end.
- CMake: The cross-platform build system generator.
- GDB: The GNU Project debugger.

## Usage

To drop into a shell with all tools pre-installed, simply run for bash user:
```bash
nix develop github:BruceChanJianLe/nix-cpp-project
```

For zsh user:
```bash
nix develop github:BruceChanJianLe/nix-cpp-project -c $SHELL
```
