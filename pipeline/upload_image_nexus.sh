#!/bin/bash

NexusDockerRegistryUrl="http://ac097da9864f24ab489ce07e285b1829-437793441.us-east-1.elb.amazonaws.com:5000"


echo "$NEXUS_PASS" | docker login -u "$NEXUS_ID" --password-stdin "$NexusDockerRegistryUrl" 
docker push "$NexusDockerRegistryUrl"/orirothschild/automate-it-task
docker rmi $(docker images --filter=reference="NexusDockerRegistryUrl/orirothschild/automate-it-task" -q)'
docker logout "$NexusDockerRegistryUrl"