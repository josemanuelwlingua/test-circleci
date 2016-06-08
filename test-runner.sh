#!/bin/bash

LOAD_REPORT=0

git log --format=%B -n 1 $CIRCLE_SHA1 >> git-description.txt
grep ^TESTS: git-description.txt>> tests.txt

result_string=$(cat tests.txt)

rm git-description.txt
rm tests.txt

result_string="${result_string/TESTS:/}"

tests=$(echo $result_string | tr ";" "\n")

test_string=""

for test in $tests
do
    test_string="$test_string functionalSuites=tests/functional/$test"
done

if [[ $test_string != "" ]]; then

    ./node_modules/.bin/intern-runner config=tests/intern reporters=Console $test_string &&
    mkdir -p $CIRCLE_TEST_REPORTS/intern &&
    cp ./report.xml $CIRCLE_TEST_REPORTS/intern

fi