pipeline {
    agent any
    tools {nodejs "NodeJS"}

            stages {

                  stage('Clone git') {
                        steps {
                            script {
                                try {
                                    git 'https://github.com/r7rajkumar/one2onetool.git'
                                    currentBuild.result = 'SUCCESS'

                                }
                                catch(all) {
                                    currentBuild.result='FAILURE'
                                }
                            }
                        }
                    }

             }
    }



