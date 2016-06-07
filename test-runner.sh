#!/bin/bash

LOAD_REPORT=0

git log --format=%B -n 1 476681c2d3eafe86d9569abd881e35d345115d47 >> git-description.txt
grep ^TESTS: git-description.txt>> tests.txt

result_string=$(cat tests.txt)

rm git-description.txt
rm tests.txt

result_string="${result_string/TESTS:/}"

tests=$(echo $result_string | tr ";" "\n")

for test in $tests
do
    #mkdir -p $CIRCLE_TEST_REPORTS/intern
    ./node_modules/.bin/intern-runner config=tests/intern functionalSuites=tests/functional/$test
    #cp ./report.xml $CIRCLE_TEST_REPORTS/intern
done