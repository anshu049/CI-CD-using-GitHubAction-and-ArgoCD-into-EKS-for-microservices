pipeline {
    agent any
    
    environment {
        IMAGE1 = "voting-app"
        Image2 = "worker"
        IMAGE3 = "result-app"
        DOCKERHUB_USERNAME = "anshuhtwt"
        REPOSITORY_TAG1 = "${DOCKERHUB_USERNAME}/${IMAGE1}:${BUILD_ID}"
        REPOSITORY_TAG2 = "${DOCKERHUB_USERNAME}/${IMAGE2}:${BUILD_ID}"
        REPOSITORY_TAG3 = "${DOCKERHUB_USERNAME}/${IMAGE3}:${BUILD_ID}"
    }

    
    stages {
        stage ('Build and Push Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh "docker build -t ${REPOSITORY_TAG1} vote/"
                    sh "docker push ${REPOSITORY_TAG1}"
                    sh "docker build -t ${REPOSITORY_TAG2} worker/"
                    sh "docker push ${REPOSITORY_TAG2}"
                    sh "docker build -t ${REPOSITORY_TAG3} result/"
                    sh "docker push ${REPOSITORY_TAG3}"
                }
            }
        }
    }
}
