#!/usr/env/bin bash

cmake -G Ninja -B build external/circt/llvm/llvm \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_INSTALL_PREFIX=install \
      -DLLVM_ENABLE_PROJECTS=mlir \
      -DLLVM_ENABLE_ASSERTIONS=ON \
      -DLLVM_ENABLE_ZSTD=OFF \
      -DLLVM_EXTERNAL_PROJECTS=circt \
      -DLLVM_EXTERNAL_CIRCT_SOURCE_DIR=external/circt \
      -DLLVM_TARGETS_TO_BUILD=host

ninja -C build -j$(nproc) \
      install-llvm-headers \
      install-llvm-libraries \
      install-mlir-headers \
      install-mlir-libraries \
      install-circt-headers \
      install-circt-libraries \
      install-llvm-config
