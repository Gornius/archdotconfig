#!/bin/bash
if pidof picom >/dev/null; then
	exec pkill picom &
else
	exec picom &
fi
