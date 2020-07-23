#!/usr/bin/env bash

export API_NAME="RollDice"

export S3_DEPLOYMENT_BUCKET=exercise-for-the-reader

export DATA_SOURCES_FUNCTION="${API_NAME}-${COLOR}-DataSources-${DATA_SOURCES_ID}"

export API_MAPPING_KEY="roll"

export API_URL="https://$DOMAIN_NAME/$API_MAPPING_KEY"