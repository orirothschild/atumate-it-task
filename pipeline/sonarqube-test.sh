#!/bin/bash

echo "*****************************"
echo "***testing with sonarqube****"
echo "*****************************"

mvn sonar:sonar \
  -Dsonar.projectKey=automate-it \
  -Dsonar.host.url="$SONARQUBE_URL" \
  -Dsonar.login="$SONARQUBE_TOKEN"