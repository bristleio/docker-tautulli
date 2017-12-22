FROM lsiobase/mono.armhf
MAINTAINER loganavatar

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_CONFIG_HOME="/config/xdg"

# set version label
ARG BUILD_DATE
ARG VERSION
ARG GIT_URL='https://github.com/JonnyWong16/plexpy'
LABEL build_version="bristle.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

COPY qemu-arm-static /usr/bin/qemu-arm-static

# install packages
RUN \
 apk add --virtual=build-dependencies \
  git && \
# check to see if tag exists
 remotecheck=$(git ls-remote --tags $GIT_URL $VERSION | wc -l) && \
# install app
 if [ $remotecheck = 0 ]; then \
    echo "Bad tag name, $VERSION" && \
    exit 1; \
  else \
    echo "Cloning $VERSION" && \
    git clone --branch $VERSION --depth 1 $GIT_URL /app/plexpy; \
 fi && \
# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
  /tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* \
	/root/.cache

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /logs
EXPOSE 8181
