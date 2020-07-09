
# automate.it-task

for this project i used kops to deploy the requested application for aws production enviroment using kops


## To start using the application

steps:
1. create cluster using kops, for example :kops create cluster --zones us-east-1a,us-east-1b ${NAME_OF_CLUSTER}
2. update the cluster to run, kops delete cluster --name ${NAME_OF_CLUSTER} --yes
3. once its up and running, we can countinue to apply our yaml files
4. apply all yaml files

notice: for jenkins i will be using a container i created myself and not the offical image. since my image contains aws_cli docker and maven
i attached the folder used to create jenkins called "configure_jenkins" and ran it with docker compose

notice 2: as for nexus docker repository, i have encountered an issue with opening its docker port, i solved it by using this helm chart:
oteemo/sonatype-nexus --version 2.3.0.
and i edited its sevice to ingress service

