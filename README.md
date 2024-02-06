# Factorio docker

This is a small project for running a Factorio server inside a docker container. It provides a simple way to configure and run a server.

## Installation

- Create a directory for the server to run in
- Create a `docker-compose.yml` file in the directory with the following content:

```yaml
version: "3"
services:
  factorio:
    image: ghcr.io/coderadu/factorio-docker:latest
    ports:
      - "34197:34197/udp"
    volumes:
      - ./data/saves:/opt/factorio/saves
      - ./data/mods:/opt/factorio/mods
    environment:
      - SAVE_FILE=save.zip
      - SERVER_NAME=Factorio Server
      - SERVER_DESCRIPTION=Factorio Server
      - MAX_PLAYERS=0
      - GAME_PASSWORD=
      - REQUIRE_USER_VERIFICATION=true
      - AUTOSAVE_SLOTS=5
      - AUTOSAVE_INTERVAL=10
      - VISIBILITY_PUBLIC=false
      - VISIBILITY_LAN=true
      - USERNAME=
      - PASSWORD=
      - TOKEN=
    stop_grace_period: 30s
```

- Configure the environment variables as needed
- Run `docker-compose up -d` to start the server
