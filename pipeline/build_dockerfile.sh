#!/bin/bash

echo "*****************************"
echo "****building docker image****"
echo "*****************************"

docker build -f deploy-war-dockerfile . --tag orirothschild/automate-it-task