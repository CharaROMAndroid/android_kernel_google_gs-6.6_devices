#!/bin/bash
# SPDX-License-Identifier: GPL-2.0

python3 download_prebuilts.py --force --build_target kernel_aarch64 --build_id 15260253
python3 download_prebuilts.py --force --build_target kernel_aarch64_16k --build_id 15260253

source private/devices/google/common/shell_utils.sh
setup_cog_env_if_needed

exec tools/bazel run \
  --config=stamp \
  --config=rango \
  //private/devices/google/rango:lga_rango_dist "$@"
