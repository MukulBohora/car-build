#!/bin/bash

ENV_NAME="$1"  # car-build-green or car-build-blue
VERSION_LABEL="v-$(date +%Y%m%d%H%M%S)"
S3_BUCKET="your-s3-bucket-name"
ZIP_FILE="app.zip"

aws s3 cp $ZIP_FILE s3://$S3_BUCKET/$ZIP_FILE

aws elasticbeanstalk create-application-version \
  --application-name car-build \
  --version-label $VERSION_LABEL \
  --source-bundle S3Bucket=$S3_BUCKET,S3Key=$ZIP_FILE

aws elasticbeanstalk update-environment \
  --environment-name $ENV_NAME \
  --version-label $VERSION_LABEL
