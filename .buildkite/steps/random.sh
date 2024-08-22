#!/bin/bash

# Configuration variables
MIN_MINUTES="${MIN_MINUTES:-5}" # Minimum time in minutes
MAX_MINUTES="${MAX_MINUTES:-15}" # Maximum time in minutes
FAILURE_CHANCE="${FAILURE_CHANCE:-10}" # Failure chance percentage (10% default in this case)

# Convert minutes to seconds
MIN_SECONDS=$((MIN_MINUTES * 60))
MAX_SECONDS=$((MAX_MINUTES * 60))

# Echo the final configuration
echo "Configuration:"
echo "MIN_MINUTES: $MIN_MINUTES"
echo "MAX_MINUTES: $MAX_MINUTES"
echo "FAILURE_CHANCE: $FAILURE_CHANCE%"

# Calculate if the script will fail or not
FAILURE_ROLL=$((RANDOM % 100 + 1))
if [ $FAILURE_ROLL -le $FAILURE_CHANCE ]; then
  WILL_FAIL="yes"
else
  WILL_FAIL="no"
fi

# Echo whether the script will fail
echo "Will the script fail? $WILL_FAIL"

# Generate a random sleep time between the min and max seconds
SLEEP_TIME=$((MIN_SECONDS + RANDOM % (MAX_SECONDS - MIN_SECONDS + 1)))

# Sleep for the random amount of time
echo "Running for $((SLEEP_TIME / 60)) minutes and $((SLEEP_TIME % 60)) seconds..."
sleep $SLEEP_TIME

# Check the previously determined failure outcome
if [ "$WILL_FAIL" = "yes" ]; then
  echo "Script failed!"
  exit 1
else
  echo "Script completed successfully!"
  exit 0
fi