# These args come from build.sh
ARG GAME_CI_UNITY_EDITOR_IMAGE
FROM $GAME_CI_UNITY_EDITOR_IMAGE

ARG BLENDER_SHORT_VERSION
ARG BLENDER_FULL_VERSION
ARG LINUX_X64

RUN echo "BLENDER_SHORT_VERSION: $BLENDER_SHORT_VERSION"
RUN echo "BLENDER_FULL_VERSION: $BLENDER_FULL_VERSION"
RUN echo "https://download.blender.org/release/Blender$BLENDER_SHORT_VERSION/blender-$BLENDER_FULL_VERSION-$LINUX_X64.tar.xz"
RUN apt-get update && apt-get install -y wget && wget https://download.blender.org/release/Blender$BLENDER_SHORT_VERSION/blender-$BLENDER_FULL_VERSION-$LINUX_X64.tar.xz && tar -xf blender-$BLENDER_FULL_VERSION-$LINUX_X64.tar.xz && rm b>
ENV PATH="$PATH:/blender-$BLENDER_FULL_VERSION-$LINUX_X64"
