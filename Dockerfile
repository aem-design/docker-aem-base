FROM        aemdesign/java-ffmpeg:jdk21

LABEL   os="debian" \
        java="oracle 21" \
        maintainer="devops <devops@aem.design>" \
        container.description="base image for aem with installed dependencies" \
        version="1.1.0" \
        imagename="aem-base" \
        test.command="java --version" \
        test.command.verify="21."

ENV TZ=UTC

RUN     \
        echo ">>> SETUP: enable multiarch <<" && \
          dpkg --add-architecture i386 && \
          apt-get update && \
        echo ">>> SETUP: aem forms libraries <<" && \
          export DEBIAN_FRONTEND=noninteractive && \
          ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
              echo $TZ > /etc/timezone && \
          apt-get install -y \
            tzdata \
            fontconfig:i386 \
            libcurl4-openssl-dev \
            libssl1.1 \
            libssl-dev \
            libcrypto++-dev \
            fonts-arphic-ukai \
            fonts-arphic-uming \
            libexpat1 \
            libexpat1-dev \
            libfontconfig1 \
            libfreetype6 \
            libc6 \
            libcurl4 \
            libice6 \
            libicu-dev \
            libsm6 \
            libuuid1 \
            libx11-6 \
            libxau6 \
            libxcb-xkb1 \
            libxext6 \
            libxinerama1 \
            libxrandr2 \
            libxrender1 \
            libnss3 \
            zlib1g \
            imagemagick && \
        echo ">>> CLEANUP <<" && \
          apt-get clean

ENV FONTCONFIG_PATH=/etc/fonts
