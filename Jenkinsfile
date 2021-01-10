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

                  stage('Testing') {
                        steps {
                            script {
                                try {
                                     env.NODE_ENV = "test"
                                     print "Environment will be : ${env.NODE_ENV}"
                                     sh 'node -v'
                                     sh 'npm prune'
                                     sh 'npm install'
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



