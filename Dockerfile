FROM        aemdesign/java-ffmpeg:jdk17

LABEL   os="debian" \
        java="oracle 17" \
        maintainer="devops <devops@aem.design>" \
        container.description="base image for aem with installed dependencies" \
        version="1.1.0" \
        imagename="aem-base" \
        test.command="java --version" \
        test.command.verify="17."

RUN     \
        echo ">>> SETUP: enable multiarch <<" && \
          dpkg --add-architecture i386 && \
          apt-get update && \
        echo ">>> SETUP: aem forms libraries <<" && \
          apt-get install -y \
            libcurl4-openssl-dev libcurl4-openssl-dev:i386 \
            libssl1.1 libssl1.1:i386 \
            libssl-dev libssl-dev:i386 \
            libcrypto++-dev libcrypto++-dev:i386 \
            fonts-arphic-ukai fonts-arphic-uming \
            libexpat1-dev libexpat1-dev:i386 \
            libfontconfig1 libfontconfig1:i386 \
            libfreetype6 libfreetype6:i386 \
            libc6 libc6:i386 \
            libcurl4 libcurl4:i386 \
            libice6 libice6:i386 \
            libicu67 libicu67:i386 \
            libsm6 libsm6:i386 \
            libuuid1 libuuid1:i386 \
            libx11-6 libx11-6:i386 \
            libxau6 libxau6:i386 \
            libxcb-xkb1 libxcb-xkb1:i386 \
            libxext6 libxext6:i386 \
            libxinerama1 libxinerama1:i386 \
            libxrandr2 libxrandr2:i386 \
            libxrender1 libxrender1:i386 \
            libnss3 libnss3:i386 \
            zlib1g zlib1g:i386 \
            imagemagick && \
        echo ">>> CONFIG: add i386 symlinks <<" && \
          ln -s `find / -name libcurl.so | grep i386` /usr/lib/libcurl.so && \
          ln -s `find / -name libcrypto.so | grep i386` /usr/lib/libcrypto.so && \
          ln -s `find / -name libssl.so | grep i386` /usr/lib/libssl.so && \
        echo ">>> CLEANUP <<" && \
          apt-get clean

ENV FONTCONFIG_PATH=/etc/fonts
