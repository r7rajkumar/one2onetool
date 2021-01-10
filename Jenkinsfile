pipeline {
    agent any
    tools {nodejs "NodeJS"}
    currentBuild.result = "SUCCESS"

            stages {

                 try {

                       stage('Clone git') {
                            steps {
                                 git 'https://github.com/r7rajkumar/one2onetool.git'
                            }
                        }

                       stage('Test'){

                         env.NODE_ENV = "test"
                         print "Environment will be : ${env.NODE_ENV}"
                         sh 'node -v'
                         sh 'npm prune'
                         sh 'npm install'
                         echo 'success'
                       }


                 }
                catch (err) {

                    currentBuild.result = "FAILURE"

                      throw err
                }

            }
    }



