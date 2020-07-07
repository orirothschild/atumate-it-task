 pipeline {
    agent any

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
               docker run --rm -v /root/.m2:/root/.m2 maven:3-alpine mvn -B -DskipTests clean package
                  '''
      }
    }


    //  stage('Build docker artifact'){
    //       steps{
              
    //           sh 'docker run --rm -v "$(pwd)":/opt/maven -w /opt/maven maven:3.3.9-jdk-8 mvn clean install'
    //          }
    // }
   
    


    stage('Upload War To Nexus'){
        steps{
            nexusArtifactUploader artifacts: [
                [
                    artifactId: 'time-tracker-parent', 
                    classifier: '',
                    file: '/var/jenkins_home/workspace/automate-it-task_master@2/web/target/time-tracker-web-0.3.1.war',
                    type: 'war'
            ]
        ], 
            credentialsId: 'nexus-access',
            groupId: 'clinic.programming.time-tracker',
            nexusUrl: 'ada3296ebd44a49bf9ca6d98a0fe4cfa-1364365130.us-east-1.elb.amazonaws.com:8081',
            nexusVersion: 'nexus3',
            protocol: 'http',
            repository: 'automate-it-task',
            version: '0.3.1'

      }
    
         
    // stage('Code Quality Check via SonarQube') {
    //     steps {
    //         script {
    //           sh "mvn sonar:sonar \
    //                 -Dsonar.projectKey=automate-it-test \
    //                 -Dsonar.host.url=http://a7a0a70e133ad4e68aee277971bb1a9c-1175145241.us-east-1.elb.amazonaws.com:9000 \
    //                 -Dsonar.login=9578a01e55d41ea1493a1384fe4cfd9a09a53bab
    //             "
    //         }
    //     }
    //  }
     }
    }
 }
