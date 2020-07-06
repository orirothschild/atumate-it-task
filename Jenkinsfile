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
         
    stage('Code Quality Check via SonarQube') {
        steps {
            script {
            def scannerHome = tool 'sonarqube';
                withSonarQubeEnv("sonarqube-container") {
                sh "${tool("sonarqube")}/bin/sonar-scanner \
                -Dsonar.projectKey=test-node-js \
                -Dsonar.sources=. \
                -Dsonar.css.node=. \
                -Dsonar.host.url=ec2-100-25-168-107.compute-1.amazonaws.com:9000 \
                -Dsonar.login=dce2d33ab9333cc94a7aca36ec3f13e9cc95a5ad"
                }
            }
        }
     }
   }
}

