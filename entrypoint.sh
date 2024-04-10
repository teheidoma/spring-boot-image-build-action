#!/bin/bash

SDKMAN_DIR=/root/.sdkman
source /root/.sdkman/bin/sdkman-init.sh
sdk install java $INPUT_JDK_DIST
chmod +x ./gradlew
./gradlew bootBuildImage > log
cat log
IMAGE_NAME=$( awk -F"'" '/^Successfully built image/ {split($2, parts, ":"); print parts[1]}' log)
IMAGE_TAG=$( awk -F"'" '/^Successfully built image/ {split($2, parts, ":"); print parts[2]}' log)
echo "IMAGE_NAME=$IMAGE_NAME" >> $GITHUB_OUTPUT
echo "IMAGE_TAG=$IMAGE_TAG" >> $GITHUB_OUTPUT
docker push $IMAGE_NAME:$IMAGE_TAG
