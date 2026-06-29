pipeline {
    agent any
    environment {
    PATH = "/usr/local/bin:${env.PATH}"
}

    stages {

        stage('Checkout') {
            steps {
                // Pulls your code from Git (skip if using "Pipeline script" mode with local files)
                checkout scm
            }
        }
        

        stage('Stop Existing Container') {
            steps {
                // '|| true' prevents pipeline failure if nothing is running yet
                sh 'docker compose down || true'
                sh 'docker rm -f devops-demo || true'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
                sh 'curl -f http://localhost:81 || echo "App not responding yet"'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! App running at http://localhost:81'
        }
        failure {
            echo 'Pipeline failed. Check logs above.'
        }
    }
}