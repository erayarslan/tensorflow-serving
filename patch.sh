#!/bin/bash

find ~/.cache -type f -path "*/external/protobuf_archive/WORKSPACE" -exec sed -i {} -e "s/com_google_protobuf/protobuf_archive/" \;
find ~/.cache -type f -path "*/external/org_tensorflow/tensorflow/core/BUILD" -exec sed -i {} -e "s/closure_proto_library/closure_js_proto_library/" \;
find ~/.cache -type f -path "*/external/org_tensorflow/tensorflow/core/BUILD" -exec sed -i {} -e "/closure_js_proto_library(/,+4 d" \;

