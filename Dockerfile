FROM openjdk:8-jre-alpine

# ARG EMBULK_VER=${EMBULK_VER:-"latest"}

# RUN apk --update add --virtual build-dependencies curl \
#     && curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VER}.jar" \
#     && chmod +x ~/.embulk/bin/embulk \
#     && apk del build-dependencies
# RUN apk --update add libc6-compat

# RUN ~/.embulk/bin/embulk gem install embulk-input-postgresql
# RUN ~/.embulk/bin/embulk gem install embulk-output-postgresql

# COPY entrypoint.sh /entrypoint.sh
# COPY config.yml /config.yml

# ENTRYPOINT ["sh", "/entrypoint.sh"]

# FROM amazoncorretto:8

ARG EMBULK_VERSION=${EMBULK_VERSION:-"latest"}


RUN yum -y update &&\
    yum -y install unzip &&\
    amazon-linux-extras install ruby2.6 &&\
    yum -y clean metadata &&\
    yum -y install ruby ruby-devel &&\
    curl --create-dirs -o /opt/embulk/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VERSION}.jar"
    
WORKDIR /opt/embulk

COPY ["install_plugins.sh", "plugins.txt", "./"]
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x ./embulk &&\
    chmod +x ./install_plugins.sh &&\
    chmod +x /usr/local/bin/entrypoint.sh &&\
    ./install_plugins.sh

CMD ["--help"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
