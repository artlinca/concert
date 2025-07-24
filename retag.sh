#!/bin/bash
export SKIP_PULL=true

tag="v1.1.0-354-20250425.100400-v1.1.0.x"

images1=(
  "ibm-roja-sra"
  "ibm-roja-portal-gw"
  "roja-ui"
  "rojacore"
  "ibm-roja-compliance"
  "ibm-roja-pipeline"
  "ibm-roja-ingestion"
  "ibm-roja-py-utils"
  "ibm-roja-postgres"
  "ibm-roja-minio"
)

images=(
"ibm-roja-compliance"
)
for image in "${images[@]}"; do
  src="cp.icr.io/cp/concert/${image}:${tag}"
  dst="localhost:5000/${image}:${tag}"
  podman load --quiet -i ${image}.tar.gz
  echo "Tagging $src -> $dst"
  podman tag "$src" "$dst"
done
