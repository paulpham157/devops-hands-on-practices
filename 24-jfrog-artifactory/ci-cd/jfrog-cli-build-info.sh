#!/usr/bin/env sh
set -eu

: "${JFROG_SERVER_ID:=training}"
: "${BUILD_NAME:=sample-service}"
: "${BUILD_NUMBER:=1}"
: "${ARTIFACT_PATH:=sample-package/package.json}"

echo "Example JFrog CLI flow. This script prints commands and does not upload by default."
echo
echo "jf rt ping --server-id=${JFROG_SERVER_ID}"
echo "jf rt upload ${ARTIFACT_PATH} generic-dev-local/sample-service/${BUILD_NUMBER}/ --build-name=${BUILD_NAME} --build-number=${BUILD_NUMBER}"
echo "jf rt build-collect-env ${BUILD_NAME} ${BUILD_NUMBER}"
echo "jf rt build-add-git ${BUILD_NAME} ${BUILD_NUMBER}"
echo "jf rt build-publish ${BUILD_NAME} ${BUILD_NUMBER}"
echo "jf rt build-promote ${BUILD_NAME} ${BUILD_NUMBER} generic-release-local --status=Released --copy=true"

