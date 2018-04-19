#!/bin/bash

source /nfs/home/tools/bazel/enable
source /nfs/home/tools/gcc/setenv-7.3.0.sh

bazel build --verbose_failures \
  --copt=-O2 --copt=-fopenmp-simd --copt=-DLIBXSMM_OPENMP_SIMD \
  --define tensorflow_xsmm=1 --define tensorflow_xsmm_convolutions=1 \
  --action_env TF_REVISION="master" \
  --copt=-mfma --copt=-mavx2 --copt=-mavx512f --copt=-mavx512cd \
  --copt=-mavx512bw --copt=-mavx512vl --copt=-mavx512dq \
  tensorflow_serving/...

