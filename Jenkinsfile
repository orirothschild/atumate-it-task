 pipeline {
    agent any

    environment{
        DOCKERHUB_PASS = credentials('dockerhub-pass')  //dockerhub id
        DOCKER_ID = credentials('dockerhub-id') //dockerhub pass
        NEXUS_PASS = credentials('nexus-pass')  //dockerhub id
        NEXUS_ID = credentials('nexus-id') //dockerhub pass
        SONAR_TOKEN = credentials('sonar-token') //dockerhub pass
    }

    stages {
        stage('Build'){
            steps{
                sh './pipeline/build.sh'
            }
        }

        stage('Upload War To Nexus'){
            steps{
                nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'time-tracker-parent', 
                        classifier: '',
                        file: '/var/jenkins_home/workspace/automate-it-task_master/web/target/time-tracker-web-0.3.1.war',
                        type: 'war'
                ]
            ], 
                credentialsId: 'nexus-access',
                groupId: 'clinic.programming.time-tracker',
                nexusUrl: 'ada3296ebd44a49bf9ca6d98a0fe4cfa-1364365130.us-east-1.elb.amazonaws.com:8081',
                nexusVersion: 'nexus3',
                protocol: 'http',
                repository: 'automate-it-task-war',
                version: '0.3.1'

            }
        }

    stage('Build dockerfile'){
         steps{
         sh './pipeline/build_dockerfile.sh'
         }
    }

    stage('upload dockerfile to nexus'){
        steps{
        sh './pipeline/upload_image_nexus.sh'
        }
    }

         
    stage('Code Quality Check via SonarQube') {
        steps {
            script {
              sh "mvn sonar:sonar \
                -Dsonar.projectKey=automate-it \
                -Dsonar.host.url=http://a573d165da94f409f8d6b90ae8ba0aae-1623065677.us-east-1.elb.amazonaws.com:9000 \
                -Dsonar.login=e1fc09db8c2c6277aed56cb0698d85f0bed90c46
                "
            }
        }
     }
     
    }
 }
