#!/bin/bash
# SPDX-License-Identifier: GPL-2.0-only

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/envsetup.sh"

DEVICE="$1"
shift

if [[ -z "${DEVICE}" ]]; then
  cat >&2 <<EOF
usage: $0 <device> [<options>]

Build the distribution package of a device.

EOF
  exit 1
fi

python3 download_prebuilts.py --force --build_target kernel_aarch64 --build_id 15266607
python3 download_prebuilts.py --force --build_target kernel_aarch64_16k --build_id 15266607

exec "${WORKSPACE_DIR}/tools/bazel" run \
  --config="${DEVICE}" \
  "//private/devices/google/${DEVICE}:${DEVICE}/dist" \
  "$@"
