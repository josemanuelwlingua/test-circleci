#!/bin/bash

LOAD_REPORT=0

git log --format=%B -n 1 765b86f08da4dd027e0ebaa3ce52321dc366217e >> git-description.txt
grep ^TESTS: git-description.txt>> tests.txt

result_string=$(cat tests.txt)

rm git-description.txt
rm tests.txt

result_string="${result_string/TESTS:/}"

tests=$(echo $result_string | tr ";" "\n")
testsLen=${#tests[@]}

for test in $tests
do
    #mkdir -p $CIRCLE_TEST_REPORTS/intern
    ./node_modules/.bin/intern-runner config=tests/intern functionalSuites=tests/functional/$test
    #cp ./report.xml $CIRCLE_TEST_REPORTS/intern
done