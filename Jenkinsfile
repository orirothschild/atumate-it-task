 pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }

    environment{
        DOCKERHUB_PASS = credentials('dockerhub-pass')  //dockerhub id
        DOCKER_ID = credentials('dockerhub-id') //dockerhub pass
        NEXUS_PASS = credentials('nexus-pass')  //dockerhub id
        NEXUS_ID = credentials('nexus-id') //dockerhub pass
        SONAR_TOKEN = credentials('sonar-token') //dockerhub pass
        APP_NAME = 'automate-it-test'
    }

    stages {
      stage('Build'){
          steps{
              
              sh '''
              mvn -B -DskipTests clean package
              '''
      }
    }
         
    stage('Code Quality Check via SonarQube') {
        steps {
            script {
              sh "mvn sonar:sonar \
                    -Dsonar.projectKey=automate-it-test \
                    -Dsonar.host.url=http://a7a0a70e133ad4e68aee277971bb1a9c-1175145241.us-east-1.elb.amazonaws.com:9000 \
                    -Dsonar.login=9578a01e55d41ea1493a1384fe4cfd9a09a53bab
                "
            }
        }
     }
   }
}

