#!/bin/bash

load_report = 0

if [$CIRCLE_BRANCH == "master"]
    ./node_modules/.bin/intern-runner config=tests/intern functionalSuites=tests/functional/*
    load_report = 1
fi