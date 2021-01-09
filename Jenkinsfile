pipeline {
    agent any
    tools {nodejs "NodeJS"}

    stages {
        stage('Download the code') {
            steps {
                //sh git clone: https://github.com/r7rajkumar/one2onetool.git
                //test
                git 'https://github.com/r7rajkumar/one2onetool.git'

            }
        }
        stage('Build') {
            steps {
                //sh 'npm install'
            }
        }

       stage('Test') {
          steps {
            sh 'node test'
          }
    }
    }
}


