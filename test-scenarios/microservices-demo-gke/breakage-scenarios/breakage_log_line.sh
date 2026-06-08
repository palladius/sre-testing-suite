#!/bin/bash

# Log a message to stdout, a local file, and to GCP Cloud Logging if authenticated.
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LOG_FILE="breakage.log"

# Format the message based on the number of arguments
if [ $# -eq 1 ]; then
  MESSAGE="INFO: $1"
elif [ $# -ge 2 ]; then
  SCENARIO="$1"
  DESC="$2"
  EXTRA="${3:-}"
  if [ -n "$EXTRA" ]; then
    MESSAGE="SCENARIO: $SCENARIO | $DESC | Details: $EXTRA"
  else
    MESSAGE="SCENARIO: $SCENARIO | $DESC"
  fi
else
  MESSAGE="INFO: Triggered breakage script"
fi

# 1. Log to local file (append) and stdout
echo "[$TIMESTAMP] $MESSAGE" >> "$LOG_FILE"
echo "📝 [$TIMESTAMP] $MESSAGE"

# 2. Log to GCP Cloud Logging (if project is set)
PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
if [ -n "$PROJECT_ID" ]; then
  # Write to Cloud Logging asynchronously so it doesn't slow down script execution
  gcloud logging write --project="$PROJECT_ID" breakage-log "$MESSAGE" --severity=INFO 2>/dev/null &
fi

exit 0
