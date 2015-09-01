#!/bin/bash
set -ev
if ([ "${TRAVIS_PULL_REQUEST}" = "false" ] && [ ! -z ${BINTRAY_USER} ]); then
    ./gradlew bintrayUpload
fi
