#!/usr/bin/env groovy


node {
  stage('Checkout'){
    withCredentials([usernamePassword(credentialsId: 'headlessdev_dockerhub', passwordVariable: 'DOCKER_HUB_PWD', usernameVariable: 'DOCKER_HUB_USER')]) {
      /* Checkout the code we are currently running against */
      checkout scm
      echo "Building branch ${env.BRANCH_NAME} ${env.GIT_COMMIT}"
      stage('login'){
        sh 'make login'
      }
      stage('Build Containers'){
        parallel (
          "runtime": {
            sh 'make build-runtime'
          },
          "devel": {
            sh 'make build-devel'
          }
        )
      }
    }
  }
}
