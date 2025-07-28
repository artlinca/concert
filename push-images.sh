#!/bin/bash
set -e

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
    "addon-ansible-feature"
)
# Define color code for light blue
LIGHT_BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color (reset)
for image in "${images[@]}"; do
  echo -e " ----- ${YELLOW}Tagging and pushing ${image} ${NC} ----- "
  echo -e "${LIGHT_BLUE}podman tag cp.icr.io/cp/concert/${image}:${tag} localhost:5001/${image}:${tag}${NC}"
  echo -e "${CYAN}podman push --remove-signatures localhost:5001/${image}:${tag}${NC}"
  # podman tag cp.icr.io/cp/concert/${image}:${tag} localhost:5001/${image}:${tag}
  podman push --remove-signatures localhost:5001/${image}:${tag} --tls-verify=false
done
