#!/bin/sh
mkdir -p .aws-sam/build/src/

if [ -f .stackery/.stackery.template.yaml ]; then
    cp .stackery/.stackery.template.yaml .aws-sam/build/template.yaml
else
    cp .stackery/template.yaml .aws-sam/build/template.yaml
fi

export GOPATH=$PWD

( cd src/Function && make )
mkdir -p .aws-sam/build/src/Function
cp src/Function/main .aws-sam/build/src/Function/main

( cd src/Function2 && make )
mkdir -p .aws-sam/build/src/Function2
cp src/Function2/main .aws-sam/build/src/Function2/main
