#!/bin/bash

echo "*****************************"
echo "***testing with sonarqube****"
echo "*****************************"

mvn sonar:sonar \
-Dsonar.projectKey=automate-it \
-Dsonar.host.url=http://a573d165da94f409f8d6b90ae8ba0aae-1623065677.us-east-1.elb.amazonaws.com:9000 \
-Dsonar.login=$SONAR_TOKEN