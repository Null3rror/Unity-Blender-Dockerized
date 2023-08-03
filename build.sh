#!/usr/bin/env bash

set -ex

UNITY_VERSION=2021.3.6f1
GAME_CI_VERSION=1.1.2 # https://github.com/game-ci/docker/releases
DOCKER_USERNAME=null3rror
DOCKER_PASSWORD=testTestPassword
REPO_NAME=unity-editor-blender
BLENDER_SHORT_VERSION=3.4
BLENDER_FULL_VERSION=3.4.1
LINUX_X64=linux-x64

if [ "$BLENDER_SHORT_VERSION" \> "2.92" ];
  then export LINUX_X64=linux-x64;
  else export LINUX_X64=linux64;
fi


# don't hesitate to remove unused components from this list
declare -a components=("windows-mono" "mac-mono" "linux-il2cpp")

for component in "${components[@]}"
do
  GAME_CI_UNITY_EDITOR_IMAGE=unityci/editor:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  IMAGE_TO_PUBLISH=${DOCKER_USERNAME}/${REPO_NAME}:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}-blender-${BLENDER_FULL_VERSION}
  docker build --build-arg GAME_CI_UNITY_EDITOR_IMAGE=${GAME_CI_UNITY_EDITOR_IMAGE} \
               --build-arg BLENDER_SHORT_VERSION=${BLENDER_SHORT_VERSION} \
               --build-arg BLENDER_FULL_VERSION=${BLENDER_FULL_VERSION} \
               --build-arg LINUX_X64=${LINUX_X64} . -t ${IMAGE_TO_PUBLISH}
# uncomment the followings to publish the built images to docker hub.
  echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin
  docker push ${IMAGE_TO_PUBLISH}
done
