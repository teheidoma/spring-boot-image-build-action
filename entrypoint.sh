#!/bin/bash

SDKMAN_DIR=/root/.sdkman
source /root/.sdkman/bin/sdkman-init.sh
echo $1
sdk install java $1
chmod +x ./gradlew
./gradlew bootBuildImage > log
IMAGE_NAME=$( awk -F"'" '/^Successfully built image/ {split($2, parts, ":"); print parts[1]}' log)
IMAGE_TAG=$( awk -F"'" '/^Successfully built image/ {split($2, parts, ":"); print parts[2]}' log)

docker push $IMAGE_NAME:$IMAGE_TAG
