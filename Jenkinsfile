pipeline {
    // configure up the agent 
    agent {
        docker {
            // use this image to setup Jenkins agent
            image 'dipanshu13/python-docker:latest'
            // mounts agents docker socket to access the host's Docker daemon
            args '--user root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    // define all the stages of the pipeline
    stages {
        // Stage 1: configure the Github repository 
        stage('Checkout') {
            steps {
                sh 'echo Github and repository and credential is already configured during pipeline configuration'
                // uncomment below line if we're using direct script in the pipeline rather a dockerfile from a repository
                // git branch: 'main', url: 'https://github.com/i-dipanshu/python-django-todo-app.git'
            }
        }

        // Stage 2 : Build and Push Docker Image 
        stage("Build Docker Image and Push to DockerHub ") {
            environment {
                DOCKER_IMAGE = "dipanshu13/django-todo:v${BUILD_NUMBER}"
                // REGISTRY_CREDENTIALS = credentials('docker-cred')
            }
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    def dockerImage = docker.image("${DOCKER_IMAGE}")
                    docker.withRegistry('https://index.docker.io/v1', 'docker-cred') {
                    dockerImage.push()
                    }
                }
            }
        }
    
        // Stage 3 : Update the Deployment File
        stage("Update the Deployment manifest") {
            environment{
                MANIFEST_GITHUB_REPO = "django-k8s-argocd-manifests"
                GITHUB_USER_NAME = "i-dipanshu"
                EMAIL = "medipansh@gmail.com"
                NAME = "Dipanshu"
            }
            steps {
                withCredentials([string(credentialsId:"github", variable: "GITHUB_TOKEN")]) {
                sh '''
                    git config user.email '${EMAIL}'
                    git config user.name '${NAME}'
                    sed -i "s/todo:v[0-9]\\{1,\\}/todo:v${BUILD_NUMBER}/" deployment.yml
                    git add deployment.yml
                    git commit -m "Update the deployment image to version${BUILD_NUMBER}"
                    git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USER_NAME}/${MANIFEST_GITHUB_REPO} HEAD:main
                '''
                }
            }
        }
    }
}