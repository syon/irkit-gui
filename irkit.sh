#!/bin/sh
docker run -it -v $(pwd)/.irkit.json:/root/.irkit.json --entrypoint /bin/bash syon/irkit
