FROM ubuntu:20.04
LABEL maintainer="vwiencek@gmail.com"

ENV JAVA_HOME=/root/.sdkman/candidates/java/current
ENV GRADLE_HOME=/root/.sdkman/candidates/gradle/current
ENV PATH=$PATH:$GRADLE_HOME/bin:$JAVA_HOME/bin

RUN apt-get update && apt-get install -y curl bash zip unzip
RUN curl -s "https://get.sdkman.io" | bash

# Install docker client
ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 20.10.3
ENV DOCKER_API_VERSION 1.41
RUN curl -fsSL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker

RUN docker --version

ENV GRADLE_VERSION 6.8.2
ENV JAVA_VERSION 15.0.2-zulu

RUN \
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh \
    && sdk install java $JAVA_VERSION \
    && sdk install gradle $GRADLE_VERSION \
    && echo $JAVA_HOME"


