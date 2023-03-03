#!/bin/sh

_MODULES=$( curl -sSfL https://vuln.go.dev/index.json | jq -r '. | keys | @sh' | tr -d "\'" )

# Write index.json
curl -sSfL -o index.json https://vuln.go.dev/index.json

# Create module directories
for m in $_MODULES ; do
  mkdir -p $m
done

# clean up directories that won't include any files
rm -rf aahframe.work stdlib toolchain

# Populate module directories with json files
for m in $_MODULES ; do
  echo "curl -sSfL -o $m.json https://vuln.go.dev/$m.json"
  curl -sSfL -o $m.json https://vuln.go.dev/$m.json
done

IDS=$( jq -r '.[].id' $( find . -type f -name '*.json' | grep -v './ID' ) | sort | uniq )

mkdir -p ID
for i in $IDS ; do
  echo "curl -sSfL -o ID/$i.json https://vuln.go.dev/ID/$i.json"
  curl -sSfL -o ID/$i.json https://vuln.go.dev/ID/$i.json
done
