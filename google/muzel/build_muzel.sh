#!/bin/bash
# SPDX-License-Identifier: GPL-2.0

python3 download_prebuilts.py --force --build_target kernel_aarch64 --build_id 15657403
python3 download_prebuilts.py --force --build_target kernel_aarch64_16k --build_id 15657403

exec tools/bazel run \
  --config=stamp \
  --config=muzel \
  //private/devices/google/muzel:lga_muzel_dist "$@"
