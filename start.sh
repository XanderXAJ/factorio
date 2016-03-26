#!/bin/sh

# Stop the factorio server gracefully
docker kill --signal SIGINT factorio && docker wait factorio

# Remove any running instance
docker rm -f factorio > /dev/null 2>&1

# Run Factorio headless server
docker run -d --name factorio -p "34197:34197/udp" -v "factorio_saves:/factorio/saves" hugecannon/factorio:latest \
	--start-server bigResource \
	--latency-ms 100 \
	--autosave-interval 10 \
	--autosave-slots 12

