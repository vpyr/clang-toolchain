# vpyr-toolchain.cmake
# CMake toolchain file to use the vpyr.sh LLVM distribution

# Host OS detection
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
    set(EXEC_SUFFIX ".exe")
else()
    set(EXEC_SUFFIX "")
endif()

# The toolchain directory is the directory containing this file
set(VPYR_TOOLCHAIN_DIR "${CMAKE_CURRENT_LIST_DIR}")

# Set C and C++ compilers
set(CMAKE_C_COMPILER "${VPYR_TOOLCHAIN_DIR}/bin/clang${EXEC_SUFFIX}")
set(CMAKE_CXX_COMPILER "${VPYR_TOOLCHAIN_DIR}/bin/clang++${EXEC_SUFFIX}")

# Use LLD as the default linker
set(CMAKE_LINKER "${VPYR_TOOLCHAIN_DIR}/bin/lld${EXEC_SUFFIX}")
set(CMAKE_C_FLAGS_INIT "-fuse-ld=lld")
set(CMAKE_CXX_FLAGS_INIT "-fuse-ld=lld")

# Use LLVM tools for archiving and symbol manipulation
set(CMAKE_AR "${VPYR_TOOLCHAIN_DIR}/bin/llvm-ar${EXEC_SUFFIX}")
set(CMAKE_RANLIB "${VPYR_TOOLCHAIN_DIR}/bin/llvm-ranlib${EXEC_SUFFIX}")
set(CMAKE_NM "${VPYR_TOOLCHAIN_DIR}/bin/llvm-nm${EXEC_SUFFIX}")
set(CMAKE_OBJDUMP "${VPYR_TOOLCHAIN_DIR}/bin/llvm-objdump${EXEC_SUFFIX}")
set(CMAKE_OBJCOPY "${VPYR_TOOLCHAIN_DIR}/bin/llvm-objcopy${EXEC_SUFFIX}")
set(CMAKE_STRIP "${VPYR_TOOLCHAIN_DIR}/bin/llvm-strip${EXEC_SUFFIX}")

# Enable LTO by default if desired (uncomment to enforce ThinLTO in your projects)
# set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)

# If cross-compiling to Windows from Linux using this toolchain:
# (Uncomment and set CMAKE_SYSTEM_NAME if you are cross-compiling)
# set(CMAKE_SYSTEM_NAME Windows)
# set(CMAKE_SYSTEM_PROCESSOR AMD64)
# set(CMAKE_C_COMPILER_TARGET x86_64-pc-windows-msvc) # or x86_64-w64-mingw32
# set(CMAKE_CXX_COMPILER_TARGET x86_64-pc-windows-msvc)
