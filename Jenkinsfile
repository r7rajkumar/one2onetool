pipeline {
    agent {
        docker {
            image 'node:14-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
    }
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
                sh 'npm install'
            }
        }
    }
}
