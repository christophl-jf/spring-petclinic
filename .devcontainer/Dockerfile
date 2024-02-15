ARG VARIANT=17-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/java:0-${VARIANT}

ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

ARG USER=vscode
VOLUME /home/$USER/.m2
VOLUME /home/$USER/.gradle

ARG JAVA_VERSION=17.0.7-ms
RUN sudo mkdir /home/$USER/.m2 /home/$USER/.gradle && sudo chown $USER:$USER /home/$USER/.m2 /home/$USER/.gradle
RUN bash -lc '. /usr/local/sdkman/bin/sdkman-init.sh && sdk install java $JAVA_VERSION && sdk use java $JAVA_VERSION'
RUN wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | sudo apt-key add -
RUN echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | sudo tee -a /etc/apt/sources.list && sudo apt update && sudo apt install -y jfrog-cli-v2-jf
ENV SDKMAN_DIR="/usr/local/sdkman"
ENV PATH=${SDKMAN_DIR}/bin:${SDKMAN_DIR}/candidates/maven/current/bin:${PATH}
COPY library-scripts/maven-debian.sh /tmp/library-scripts/
RUN apt-get update && bash /tmp/library-scripts/maven-debian.sh "latest" "${SDKMAN_DIR}"