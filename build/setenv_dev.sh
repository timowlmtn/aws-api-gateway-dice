#!/usr/bin/env bash

export DOMAIN_NAME=exercise_for_the_reader

export API_MAPPING_ID=exercise_for_the_reader


export ENVIRONMENT="dev"

export USAGE_PLAN_ID="exercise_for_the_reader"

export S3_STAGE_BUCKET=exercise-for-the-reader
export S3_STAGE_BUCKET_ARN=arn:aws:s3:::$S3_STAGE_BUCKET/*

export X_API_KEY=exercise_for_the_reader

source build/setenv.sh