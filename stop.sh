#!/bin/sh
image=syon/irkit-gui
docker rm $(docker stop $(docker ps -a -q --filter ancestor=$image --format="{{.ID}}"))
