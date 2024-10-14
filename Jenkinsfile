pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    // Log in to Docker Hub
                    sh "echo \$DOCKER_HUB_PASSWORD | docker login -u \$DOCKER_HUB_USERNAME --password-stdin"
                    
                    // Push the Docker image to the Dev repository
                    sh "docker push surutheen/dev1:latest"
                }
            }
        }

        stage('Push to Prod') {
            when {
                branch 'main'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    // Log in to Docker Hub
                    sh "echo \$DOCKER_HUB_PASSWORD | docker login -u \$DOCKER_HUB_USERNAME --password-stdin"
                    
                    // Tag the Docker image for production
                    sh "docker tag surutheen/dev1:latest surutheen/prod1:latest"
                    
                    // Push the Docker image to the Prod repository
                    sh "docker push surutheen/prod1:latest"
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
