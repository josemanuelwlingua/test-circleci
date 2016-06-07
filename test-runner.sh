#!/bin/bash

LOAD_REPORT=0

git log --format=%B -n 1 eb610e30c3b03b3a6c4268279bfa5c08567f82c2 >> git-description.txt
grep ^circle git-description.txt>> tests.txt

result_string=$(cat tests.txt)

rm git-description.txt
rm tests.txt

result_string="${result_string/mod/}"

tests=$(echo $result_string | tr ";" "\n")

for test in $tests
do
    echo $test
done

exit 1