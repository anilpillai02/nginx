pipeline {
environment {
    registry = "anilswa"
    registryCredential = "dockerhub"
    dockerImage = 'nginx'
  }
    agent any
  stages {
  stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
  steps {
   script {
        checkout scm
    }
    }
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
    steps{
      script {
        app = docker.build("anilswa/nginx")
    }
    }
    }


    stage('Push image') {
    steps {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
 script {

          docker.withRegistry( '', registryCredential ) {
          app.push("${env.BUILD_NUMBER}")
      }
      }
      }
     }
    }
    }
    
