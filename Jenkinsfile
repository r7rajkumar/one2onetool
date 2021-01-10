pipeline {
    agent any
    tools {nodejs "NodeJS"}
    currentBuild.result = "SUCCESS"

            stages {

                  stage('Clone git') {
                        steps {
                            script {
                                try {
                                    git 'https://github.com/r7rajkumar/one2onetool.git'
                                }
                                catch(all) {
                                    currentBuild.result='FAILURE'
                                }
                            }
                        }
                    }

             }
    }



