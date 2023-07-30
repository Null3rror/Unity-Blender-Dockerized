#!/usr/bin/env bash

set -ex

UNITY_VERSION=2021.3.6f1
GAME_CI_VERSION=1.1.2 # https://github.com/game-ci/docker/releases
MY_USERNAME=null3rror
REPO_NAME=unity-editor-blender
# don't hesitate to remove unused components from this list
declare -a components=("windows-mono" "mac-mono" "linux-il2cpp" "webgl" "android" "ios")

for component in "${components[@]}"
do
  GAME_CI_UNITY_EDITOR_IMAGE=unityci/editor:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  IMAGE_TO_PUBLISH=${MY_USERNAME}/${REPO_NAME}:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  docker build --build-arg GAME_CI_UNITY_EDITOR_IMAGE=${GAME_CI_UNITY_EDITOR_IMAGE} . -t ${IMAGE_TO_PUBLISH}
# uncomment the following to publish the built images to docker hub. First run docker login before you publish
#  docker push ${IMAGE_TO_PUBLISH}
done
