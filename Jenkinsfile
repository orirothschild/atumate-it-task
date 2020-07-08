 pipeline {
    agent any

    environment{
        NEXUS_PASS = credentials('nexus-pass')  
        NEXUS_ID = credentials('nexus-id') 
        SONARQUBE_TOKEN = credentials('sonarqube-token') 
    }

    stages {
        stage('Build'){
            steps{
                sh './pipeline/build.sh'
            }
        }

        stage('Code Quality Check via SonarQube') {
        steps {
            script {
              sh './pipeline/sonarqube-test.sh'
            }
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
                nexusUrl: 'ac097da9864f24ab489ce07e285b1829-437793441.us-east-1.elb.amazonaws.com:8081',
                nexusVersion: 'nexus3',
                protocol: 'http',
                repository: 'automate-it-war',
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
     
    }
 }
