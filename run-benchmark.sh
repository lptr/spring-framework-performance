#!/bin/bash

GRADLE_VERSION="${GRADLE_VERSION:-6.2.2}"

sync

gradle-profiler/gradlew --project-dir gradle-profiler install

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    --project-dir spring-framework \
    --scenario-file spring-framework.conf \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 1 \
    --iterations ${1:-20} \
    --benchmark noOptimizations onlyVfsRetention \
    --csv-format long
