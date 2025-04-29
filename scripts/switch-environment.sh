#!/bin/bash

BLUE_ENV="car-build-blue"
GREEN_ENV="car-build-green"

aws elasticbeanstalk swap-environment-cnames \
  --source-environment-name $BLUE_ENV \
  --destination-environment-name $GREEN_ENV
