#!/usr/bin/env bash

export API_NAME="RollDice"

export PATH=/c/Program\ Files/Python37:/c/Program\ Files/Python37/scripts:$PATH
export AWS_PROFILE="default"
export VPC_ID="exercise_for_the_reader"
export SUBNET_IDS="exercise_for_the_reader-1, exercise_for_the_reader-2"
export LAMBDA_SECURITY_GROUP="exercise_for_the_reader"

source build/setenv_dev_blue.sh

export X_API_KEY="exercise_for_the_reader"

export LAMBDA_ROLL_NAME="$API_NAME-$COLOR-LambdaRollDice-$LAMBDA_ROLL_ID"

