pipeline {
    agent any

    stages {
        stage('changing file permission') {
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build Docker image using build script file
                    sh './build.sh'
                }
            }
        }

        stage('Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-password-id', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
        }  
        stage('Deploy') {
            steps {
                script {
                    sh './deploy.sh'
                    }
                }
            }
        }
    }


