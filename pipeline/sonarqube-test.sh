#!/bin/bash

echo "*****************************"
echo "***testing with sonarqube****"
echo "*****************************"

mvn sonar:sonar \
  -Dsonar.projectKey=automate-it \
  -Dsonar.host.url=http://a607504ba8e0c4ab48628792918b149b-144520793.us-east-1.elb.amazonaws.com:9000 \
  -Dsonar.login=fdac747ff05f7df6d1c088b24c7e4abec8c4b74b