#!/bin/bash
export SKIP_PULL=true

tag="v1.1.0-354-20250425.100400-v1.1.0.x"

images=(
    "addon-ansible-feature"
    "addon-expect-feature"
    "addon-faas-feature"
    "addon-mqws-feature"
    "addon-napalm-feature"
    "addon-pdf-feature"
    "addon-puppeteer-feature"
    "addon-textfsm-feature"
    "addon-themes-feature"
    "addon-toolbox-feature"
    "infra-influxdb-feature"
    "infra-minio-feature"
    "infra-mysql-feature"
    "infra-postgresql-feature"
    "infra-rabbitmq-feature"
    "infra-redis-feature"
    "pliant-ai-core-feature"
    "pliant-api-feature"
    "pliant-api-radius-feature"
    "pliant-app-gateway-feature"
    "pliant-compiler-feature"
    "pliant-db-migration-feature"
    "pliant-faas-image-builder-feature"
    "pliant-flow-converter-feature"
    "pliant-front-feature"
    "pliant-image-registry-feature"
    "pliant-proxy-feature"
    "pliant-python-pipreqs-feature"
    "pliant-scheduler-feature"
    "pliant-versioning-feature"
    "pliant-worker-nodejs-config-feature"
    "pliant-worker-nodejs-feature"
    "rna-utils-feature"
)

images1=(
"ibm-roja-compliance"
)
for image in "${images[@]}"; do
#  src="cp.icr.io/cp/concert/${image}:${tag}"
#  dst="localhost:5001/${image}:${tag}"
  echo "podman load --quiet -i ${image}.tar.gz"
  podman load --quiet -i ${image}.tar.gz
#  echo "Tagging $src -> $dst"
#  echo "podman tag $src $dst"
done
podman load --quiet -i registry.tar.gz
