#!/bin/bash

SDKMAN_DIR=/root/.sdkman
source /root/.sdkman/bin/sdkman-init.sh
sdk install java $1
sdk install gradle $2
chmod +x ./gradlew
./gradlew bootBuildImage
IMAGE_NAME=$( awk -F"'" '/^Successfully built image/ {split($2, parts, ":"); print parts[1]}' log)
IMAGE_TAG=$( awk -F"'" '/^Successfully built image/ {split($2, parts, ":"); print parts[2]}' log)

docker push $IMAGE_NAME:$IMAGE_TAG
