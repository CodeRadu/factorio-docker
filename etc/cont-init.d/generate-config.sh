#! /command/with-contenv bash

SETTINGS_PATH="/opt/factorio/data/server-settings.json"

echo "Generating server settings"

cat <<EOF > $SETTINGS_PATH
{
  "name": "$SERVER_NAME",
  "description": "$SERVER_DESCRIPTION",
  "tags": ["game", "tags"],
  "max_players": $MAX_PLAYERS,
  "game_password": "$GAME_PASSWORD",
  "require_user_verification": $REQUIRE_USER_VERIFICATION,
  "visibility": {
    "public": $VISIBILITY_PUBLIC,
    "lan": $VISIBILITY_LAN
  },
  "username": "$USERNAME",
  "password": "$PASSWORD",
  "token": "$TOKEN",
  "autosave_interval": $AUTOSAVE_INTERVAL,
  "autosave_slots": $AUTOSAVE_SLOTS
}
EOF
cat $SETTINGS_PATH