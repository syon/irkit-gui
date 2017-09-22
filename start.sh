#!/bin/sh
docker build -t syon/irkit-gui .
docker stop irkit-gui
docker rm irkit-gui
docker run --name irkit-gui -d -p 5005:3000 syon/irkit-gui
