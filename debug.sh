#!/bin/sh
docker build -t syon/irkit-gui .
docker run -it -p 5000:5000 -v $(pwd)/irkit-data:/root syon/irkit-gui bash
