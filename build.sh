#!/bin/bash

source /nfs/home/tools/bazel/enable
source /nfs/home/tools/gcc/setenv.sh

FLAGS="--copt=-mfma --copt=-mavx2 --copt=-mavx512f --copt=-mavx512cd --copt=-mavx512bw --copt=-mavx512vl --copt=-mavx512dq"
FLAGS="--copt=-mfma --copt=-mavx2"

# NDEBUG preprocessor symbol (as implied by "-c opt") "allows" for AVX-512
# However, an Eigen assertion (hidden by NDEBUG) is not present with AVX2.
#
bazel build --verbose_failures -c opt --copt=-DNDEBUG \
  --copt=-O2 --copt=-fopenmp-simd --copt=-DLIBXSMM_OPENMP_SIMD \
  --define tensorflow_xsmm=1 --define tensorflow_xsmm_convolutions=1 \
  --action_env TF_REVISION="master" ${FLAGS} \
  tensorflow_serving/...

