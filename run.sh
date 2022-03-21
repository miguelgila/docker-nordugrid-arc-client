#!/bin/bash

SLEEP_DURATION=14400

mkdir -p /tmp

while true; do

    # Fetch certificates
    echo "$(date '+%d.%m.%Y %T') [INFO] Starting fetch-crl"
    fetch-crl -q

    # If failed, warn about it but do not exit
    EXIT_CODE=$?
    test "$EXIT_CODE" -gt 0 && echo "$(date '+%d.%m.%Y %T') [WARNING] fetch-crl exited with exit code: $EXIT_CODE"

    # Sleep for 4 hours
    echo "$(date '+%d.%m.%Y %T') [INFO] Sleeping for $SLEEP_DURATION seconds"
    sleep $SLEEP_DURATION

done
