# vpyr.sh LLVM Distribution

[![CI Build](https://github.com/vpyr/clang-toolchain/actions/workflows/vpyr-llvm-ci.yml/badge.svg)](https://github.com/vpyr/clang-toolchain/actions/workflows/vpyr-llvm-ci.yml)

This repository contains the automated CI/CD pipeline to generate a full Stage-3 BOLT and LTO optimized LLVM distribution.

## Features

- **Linux Toolchain:** A full Stage-3 compiler optimized with BOLT and Profile-Guided Optimization (PGO).
- **Windows Toolchain:** Native Windows compiler optimized with ThinLTO.
- **Cross-Compilation:** The Linux toolchain comes with Windows (`x86_64-w64-mingw32`) runtimes out of the box, allowing you to cross-compile Windows binaries directly from Linux.
- **Runtimes:** Includes `compiler-rt`, `libcxx`, `libcxxabi`, and `libunwind`.
- **Ready to Use:** Includes a convenient `vpyr-toolchain.cmake` toolchain file to integrate cleanly with any CMake project without relying on system compilers.

## Downloading Artifacts

We rely on GitHub Actions for the build. To get the toolchain, simply head over to the [Actions Tab](https://github.com/vpyr/clang-toolchain/actions/workflows/vpyr-llvm-ci.yml) and download the artifacts from the latest successful run:

- `vpyr-llvm-linux-x64.tar.gz`
- `vpyr-llvm-windows-x64.zip`

## Usage with CMake

Extract the artifact and pass the included toolchain file to your CMake configuration step:

```bash
cmake -DCMAKE_TOOLCHAIN_FILE=/path/to/extracted/vpyr-toolchain.cmake -S . -B build
cmake --build build
```
