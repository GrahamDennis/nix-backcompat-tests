#!/bin/bash

for i in */; do pushd $i; ./test.sh; popd; done
