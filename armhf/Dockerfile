FROM resin/raspberrypi3-alpine-python:3.6-slim
MAINTAINER loganavatar

# set version label
ARG BUILD_DATE
ARG VERSION
ARG GIT_URL='https://github.com/JonnyWong16/plexpy'
LABEL build_version="bristle.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	make \
        git \
	python-dev && \

# install pycryptodomex
 pip install --no-cache-dir -U \
	pycryptodomex && \

# check to see if tag exists
 remotecheck=$(git ls-remote --tags $GIT_URL $VERSION | wc -l) && \

# install app
 if [ $remotecheck = 0 ]; then \
    echo "Bad tag name, $VERSION" && \
    exit 1; \
  else \
    echo "Cloning $VERSION" && \
    git clone --depth 1 $GIT_URL /app/plexpy && \
    cd /app/plexpy && \
    git checkout tags/$VERSION; \
 fi && \

# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /logs
EXPOSE 8181
