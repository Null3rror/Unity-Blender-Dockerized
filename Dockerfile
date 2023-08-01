# GAME_CI_UNITY_EDITOR_IMAGE comes from build.sh
ARG GAME_CI_UNITY_EDITOR_IMAGE
FROM $GAME_CI_UNITY_EDITOR_IMAGE

ARG BLENDER_SHORT_VERSION=2.91
ARG BLENDER_FULL_VERSION=2.91.0

RUN echo "BLENDER_SHORT_VERSION: $BLENDER_SHORT_VERSION"
RUN echo "BLENDER_FULL_VERSION: $BLENDER_FULL_VERSION"
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://download.blender.org/release/Blender$BLENDER_SHORT_VERSION/blender-$BLENDER_FULL_VERSION-linux64.tar.xz
RUN tar -xf blender-$BLENDER_FULL_VERSION-linux64.tar.xz
RUN rm blender-$BLENDER_FULL_VERSION-linux64.tar.xz

ENV PATH="$PATH:/blender-$BLENDER_FULL_VERSION-linux64"
