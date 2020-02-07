#!/bin/bash

xdotool search --class "minecraft" | xargs -I{} xdotool mousedown --window {} 3
