#!/bin/bash

APP_NAME="car-build"
KEEP_LATEST=5

aws elasticbeanstalk describe-application-versions \
  --application-name $APP_NAME \
  --query 'ApplicationVersions[?Status==`PROCESSED`].VersionLabel' \
  --output text | tr '\t' '\n' | sort -r | tail -n +$((KEEP_LATEST + 1)) | while read version; do
    aws elasticbeanstalk delete-application-version \
      --application-name $APP_NAME \
      --version-label $version \
      --delete-source-bundle
done
