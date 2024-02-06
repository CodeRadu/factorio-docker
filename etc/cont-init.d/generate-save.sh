#! /command/with-contenv bash

ENTRYPOINT="/opt/factorio/bin/x64/factorio"

SAVE_PATH="/opt/factorio/saves/$SAVE_FILE"

if [ ! -f $SAVE_PATH ]; then
  echo "Generating new save file"
  $ENTRYPOINT --create $SAVE_PATH --map-gen-settings /opt/factorio/data/map-gen-settings.json
fi