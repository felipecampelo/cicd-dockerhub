FROM openjdk:8-jre-alpine

ARG EMBULK_VER=${EMBULK_VER:-"latest"}

RUN apk --update add --virtual build-dependencies curl \
    && curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VER}.jar" \
    && chmod +x ~/.embulk/bin/embulk \
    && apk del build-dependencies
RUN apk --update add libc6-compat

RUN ~/.embulk/bin/embulk gem install embulk-input-postgresql
RUN ~/.embulk/bin/embulk gem install embulk-output-postgresql

COPY entrypoint.sh /entrypoint.sh
COPY config.yml /config.yml

ENTRYPOINT ["sh", "/entrypoint.sh"]
