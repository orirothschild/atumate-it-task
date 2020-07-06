 pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    environment{
        PASS = credentials('registry-pass')  //dockerhub id
        DOCKER_ID = credentials('registry-id') //dockerhub pass
    }
    stages {
        stage('Build'){
            steps{
                
                sh '''
                mvn -B -DskipTests clean package
                '''
            }
        }
         

             stage('Test') {
            steps {
                sh '''
                mvn test
                '''
            }
            
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
 }

