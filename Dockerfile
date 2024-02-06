FROM debian:bookworm
ARG S6_OVERLAY_VERSION=3.1.6.2
ARG VERSION=1.1.101

ENV SAVE_FILE=save.zip
ENV SERVER_NAME="Factorio Server"
ENV SERVER_DESCRIPTION="Factorio Server"
ENV MAX_PLAYERS=0
ENV GAME_PASSWORD=""
ENV REQUIRE_USER_VERIFICATION=true
ENV AUTOSAVE_SLOTS=5
ENV AUTOSAVE_INTERVAL=10
ENV VISIBILITY_PUBLIC=false
ENV VISIBILITY_LAN=true
ENV USERNAME=""
ENV PASSWORD=""
ENV TOKEN=""

LABEL org.opencontainers.image.source="https://github.com/CodeRadu/factorio-docker"

RUN apt update && apt upgrade -y && apt install -y xz-utils

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

ADD https://factorio.com/get-download/${VERSION}/headless/linux64 /tmp/factorio.tar.xz
RUN tar -xJf /tmp/factorio.tar.xz -C /opt
RUN cp /opt/factorio/data/map-gen-settings.example.json /opt/factorio/data/map-gen-settings.json

WORKDIR /opt/factorio

COPY etc/ /etc

ENTRYPOINT [ "/init" ]