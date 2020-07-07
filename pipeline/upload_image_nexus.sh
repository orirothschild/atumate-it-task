#!/bin/bash

NexusDockerRegistryUrl="ada3296ebd44a49bf9ca6d98a0fe4cfa-1364365130.us-east-1.elb.amazonaws.com:8083"

echo "$NEXUS_PASS" | docker login -u "$NEXUS_ID" --password-stdin "$NexusDockerRegistryUrl"