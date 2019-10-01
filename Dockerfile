FROM ubuntu:18.04
MAINTAINER Vincent Wiencek <vwiencek@gmail.com>

RUN apt-get update && apt-get install -y curl bash zip unzip
RUN curl -s "https://get.sdkman.io" | bash

# Install docker client
ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 17.03.1-ce
ENV DOCKER_API_VERSION 1.27
RUN curl -fsSL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker

RUN docker --version

ENV GRAILS_VERSION 5.6.2
ENV JAVA_VERSION 12.0.2-zulu

RUN \
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh \
    && sdk install java $JAVA_VERSION \
    && sdk install gradle $GRADLE_VERSION \
    && echo $JAVA_HOME"

ENV JAVA_HOME=/root/.sdkman/candidates/java/current
ENV GRADLE_HOME=/root/.sdkman/candidates/gradle/current
ENV PATH=$PATH:$GRADLE_HOME/bin:$JAVA_HOME/bin

