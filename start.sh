#!/bin/sh
docker build -t syon/irkit-gui .
docker run -d -p 5005:3000 -v $(pwd):/work syon/irkit-gui
