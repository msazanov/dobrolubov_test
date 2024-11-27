#!/bin/bash

LOG_FILE="/var/log/monitoring.log"
BIN_NAME="test"
API_URL="https://test.com/monitoring/test/api"
LAST_PID_FILE="/tmp/${BIN_NAME}_pid"

echo "$(date): Monitor Started" >> "$LOG_FILE"

while true; do
    PID=$(pgrep -x "$BIN_NAME")
    if [ -n "$PID" ]; then
        if [ ! -f "$LAST_PID_FILE" ] || [ "$(cat "$LAST_PID_FILE")" != "$PID" ]; then
            echo "$(date): $BIN_NAME restarted (PID: $PID)" >> "$LOG_FILE"
            echo "$PID" > "$LAST_PID_FILE"
        fi


        if ! curl -k -s -X POST "$API_URL" -d '{"status":"running"}' -H "Content-Type: application/json"; then
            echo "$(date): Monitoring server not reachable" >> "$LOG_FILE"
        fi
    fi

    sleep 60
done
