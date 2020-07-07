rerun this app stages
apply all the enviroment variables from files
update kops to run cluster

type this command : "echo -n 'mediumpostgres' | base64
bWVkaXVtcG9zdGdyZXM="

apply all jenkins yaml files

apply sonarqube yaml files or use helm chart with override to service port 
helm install sonarqube oteemocharts/sonarqube --set ingress.hosts[0].servicePort=9000,
update service to loadbalancer


