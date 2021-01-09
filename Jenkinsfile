pipeline {
    agent any
    tools {nodejs "latest"}

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


