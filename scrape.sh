#!/bin/sh

# Write index db
curl -sSfL -o db.json https://vuln.go.dev/index/db.json

# Write index modules
curl -sSfL -o modules.json https://vuln.go.dev/index/modules.json
_IDS=$( cat modules.json | jq -r '.[].vulns[].id' | sort | uniq )

# Write index vulns
curl -sSfL -o vulns.json https://vuln.go.dev/index/vulns.json

mkdir -p ID
for i in $_IDS ; do
  echo "curl -sSfL -o ID/$i.json https://vuln.go.dev/ID/$i.json"
  curl -sSfL -o ID/$i.json https://vuln.go.dev/ID/$i.json
done
