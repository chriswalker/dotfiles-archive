#!/usr/bin/bash

killall -q polybar

echo "---" | tee -a /tmp/polybar-main.log
polybar -l info -c $HOME/.config/polybar/config.ini main >>/tmp/polybar-main.log 2>&1 &
echo "Started main polybar..."
