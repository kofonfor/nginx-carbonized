pipeline {
    agent any
    stages {
        stage('Build a Docker image') {
            steps {
                sh "echo ${BUILD_NUMBER}"
                sh "docker build -t kofonfor/nginx-carbonized:0.1.0 --rm ./ && docker build -t kofonfor/nginx-carbonized:latest --rm ./"
                sh "docker push kofonfor/nginx-carbonized:0.1.0 && docker push kofonfor/nginx-carbonized:latest"
            }
        }
    }
}
