#!/usr/bin/env bash

# Kill any already launched polybar
polybar-msg cmd quit

# Launch bars
echo "---" | tee -a /tmp/polybar_main.log
polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown
