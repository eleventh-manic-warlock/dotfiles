#!/bin/sh

# get the brightness value
BRIGHT_VAL=$(brightnessctl i | awk -F '[()]' '/Current brightness/ {print $2}' | tr -d '%')

# check hyprsunset status
if ps x | grep -v grep | grep -q "hyprsunset" > /dev/null 2>&1; then
  STATUS="sunset"
else
  STATUS="normal"
fi

# output JSON for waybar
printf '{"text": "%s", "alt": "%s", "percentage": %s}\n' "$BRIGHT_VAL" "$STATUS" "$BRIGHT_VAL"
