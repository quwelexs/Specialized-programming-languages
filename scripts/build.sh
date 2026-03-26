#!/bin/bash
echo "Етап Build: Формування артефактів"
mkdir -p artifacts

BUILD_TIME=$(date +"%Y-%m-%dT%H:%M:%S")
COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
PROJECT="my-demo-project"
VERSION="1.0.0"

#запис у файл
cat <<EOF > artifacts/build_info.txt
build_time: $BUILD_TIME
commit: $COMMIT
project: $PROJECT
version: $VERSION
EOF

echo "Артефакти збірки створено у artifacts/build_info.txt"