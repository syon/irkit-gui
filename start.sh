#!/bin/sh
docker build -t syon/irkit-gui .
docker run -it --rm -p 5000:5000 -v $(pwd)/irkit-data:/root syon/irkit-gui
