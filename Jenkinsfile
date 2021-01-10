pipeline {

    environment {
        registryCredential = 'xxxxx-dockerhub'
        dockerImage = ''
    }

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

                  stage('Build') {
                        steps {

                            when {
                                     branch 'Staging'  //only run these steps on the master branch

                             }

                            script {
                                try {

                                     sh 'npm install'
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
                                     currentBuild.result = 'SUCCESS'

                                }
                                catch(all) {
                                    currentBuild.result='FAILURE'
                                }
                            }
                        }
                  }

                  stage('Build Docker images') {
                        steps {
                            script {
                                try {
                                     sh './dockerBuild.sh'
                                     currentBuild.result = 'SUCCESS'

                                }
                                catch(all) {
                                    currentBuild.result='FAILURE'
                                }
                            }
                        }
                  }

                   stage('Deploy') {
                        steps {
                            script {
                                try {
                                     echo 'Push to Repo'
                                     docker.withRegistry( '', registryCredential ) {
                                     dockerImage.push("$BUILD_NUMBER")
                                     dockerImage.push('latest')
                                     currentBuild.result = 'SUCCESS'

                                }
                                catch(all) {
                                    currentBuild.result='FAILURE'
                                }
                            }
                        }
                  }

                  stage('Cleanup') {
                        steps {
                             echo 'prune and cleanup'
                             sh 'npm prune'
                             sh 'rm node_modules -rf'
                             sh "docker rmi one2onetool:$BUILD_NUMBER"
                             sh "docker rmi one2onetool:latest"

                              mail body: 'project build successful',
                              from: 'xxxx@yyyyy.com',
                              mail to: 'xxxx@example.com',
                              subject: 'project cleanup successful',
                        }
                  }

            }

             post {

                    success {
                        echo 'I succeeded!'
                        mail to: 'xxxx@example.com',
                        subject: "Pipeline Success: ${currentBuild.fullDisplayName}",
                        body: "Pipeline successful ${env.BUILD_URL}"
                    }

                    failure {
                          echo 'I failed :('
                          mail to: 'xxxx@example.com',
                          subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                          body: "Something is wrong with ${env.BUILD_URL}"
                    }
             }

    }



