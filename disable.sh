#!/usr/bin/bash

# Adjust these names to match your exact xinput list output
KEYBOARD_NAME="AT Translated Set 2 keyboard"
TOUCHPAD_NAME="SynPS/2 Synaptics TouchPad"

# Get device IDs
KEYBOARD_ID=$(xinput list --id-only "$KEYBOARD_NAME")
TOUCHPAD_ID=$(xinput list --id-only "$TOUCHPAD_NAME")

# Disable them
if [ -n "$KEYBOARD_ID" ]; then
    xinput disable "$KEYBOARD_ID"
fi

if [ -n "$TOUCHPAD_ID" ]; then
    xinput disable "$TOUCHPAD_ID"
fi

