#!/bin/bash

echo "*****************************"
echo "****building docker image****"
echo "*****************************"

docker build -f deploy-war-dockerfile . --tag automate-it-task