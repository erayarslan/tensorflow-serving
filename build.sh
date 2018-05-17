#!/bin/bash

source /nfs/home/tools/bazel/enable
source /nfs/home/tools/gcc/setenv.sh

bazel build --verbose_failures \
  --copt=-O2 --copt=-fopenmp-simd --copt=-DLIBXSMM_OPENMP_SIMD \
  --define tensorflow_xsmm=1 --define tensorflow_xsmm_convolutions=1 \
  --action_env TF_REVISION="master" \
  --copt=-mfma --copt=-mavx2 \
  tensorflow_serving/... tensorflow_serving/apis/...
