#!/bin/sh
VENDOR=fvigotti
DRIVER=cifs

set -o errexit
set -o pipefail

driver_dir=$VENDOR${VENDOR:+"~"}${DRIVER}

plugin_dir=${1:-/tmp/local/bin}
sleep_time=${2:-0}

if [ ! -d "$plugin_dir/$driver_dir" ]; then
  mkdir -p "$plugin_dir/$driver_dir"
fi

for bin in jq mount.cifs cifs; do
  cp "$bin" "$plugin_dir/$driver_dir/.$bin"
  mv -f "$plugin_dir/$driver_dir/.$bin" "$plugin_dir/$driver_dir/$bin"
done

while [ $sleep_time -gt 0 ]; do
  sleep 3600
done
