pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage('git repo') {
            steps {
                git branch : 'main',
                url : 'https://github.com/TukaramAchugatla/Bank.git'
                }
        }
        stage('Maven Clean') {
            steps {
                sh 'mvn clean'
            }
        }
        stage('Maven Compile') {
            steps {
                sh 'mvn compile'
                }
        }
        stage('Maven Test') {
            steps {
                sh 'mvn test'
                }
        }
       stage('Maven Install') {
        steps {
                    sh 'mvn install'
                }
            }

            stage('Maven Package') {
                steps {
                    sh 'mvn package'
                }
            }

            stage('Docker Image') {
                steps {
                    sh 'docker build -t achugatla/basic .'
                }
            }
            stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'Docker-hub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push achugatla/basic'
            }
        }
    }
}