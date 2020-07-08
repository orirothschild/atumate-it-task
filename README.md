rerun this app stages
apply all the enviroment variables from files
update kops to run cluster

apply all yaml files

but use regular docker jenkins

apply sonarqube yaml files or use helm chart with override to service port 

helm repo add oteemo https://oteemo.github.io/charts/
helm install sonarqube oteemocharts/sonarqube --set ingress.hosts[0].servicePort=9000,

helm install nexus stable/sonatype-nexus  
then adjust service ports

update service to from helm to loadbalancer


-----------------------


create nexus repository for naven file

use jenkins pipeline snippet for war uplead to nexus





