#!/usr/bin/env bash

# kill old bars
killall -q polybar

# wait until fully stopped
while pgrep -x polybar >/dev/null; do sleep 1; done

# detect monitor
MONITOR=$(xrandr | grep "primary" | cut -d" " -f1)

if [ -z "$MONITOR" ]; then
  MONITOR=$(xrandr | grep " connected" | head -n1 | cut -d" " -f1)
fi

# launch bar
MONITOR=$MONITOR polybar example &
