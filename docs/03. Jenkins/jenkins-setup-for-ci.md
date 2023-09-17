# Setting Up Jenkins Server for Continuous Integration (CI)

In this guide, we'll walk you through the process of setting up a Jenkins Server for Continuous Integration (CI) on Ubuntu.

## Installation

To begin, follow these steps to install Jenkins on your Ubuntu system:

1. Update your package list:
   ```sh
   sudo apt update
   ```

2. Install OpenJDK 11:
   ```sh
   sudo apt install openjdk-11-jre -y
   ```

3. Add the Jenkins repository key:
   ```sh
   curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
   ```

4. Add the Jenkins repository to your sources:
   ```sh
   echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
   ```

5. Update the package list again:
   ```sh
   sudo apt-get update
   ```

6. Install Jenkins:
   ```sh
   sudo apt-get install jenkins -y
   ```

## Initial Setup

### Step 1 - Retrieve Default Password

To access Jenkins for the first time, you'll need the default admin password. Run this command to retrieve it:

```sh
cat /var/lib/jenkins/secrets/initialAdminPassword
```

### Step 2 - Install Recommended Plugins

In a production environment, you would create a user, but for this guide, we'll skip that step. Click "skip and continue as admin" to access Jenkins using the admin ID and the password you obtained in Step 1.

Next, install the recommended plugins.

### Step 3 - Install Docker Pipeline Plugin

Navigate to the Plugin section in Jenkins at `http://localhost:8080/manage/pluginManager/available` and install the Docker Pipeline Plugin.

This plugin is essential for pulling and pushing Docker images to DockerHub. Note that the Git plugin is already installed in Step 2.

### Step 4 - Install Docker and Configure Jenkins

Execute the following commands one by one to install Docker. Make sure to replace 'ubuntu' with the appropriate username according to your instance:

```sh
sudo apt update
sudo apt install docker.io -y # installs Docker
sudo su -
usermod -aG docker jenkins # Add the 'jenkins' user to the 'docker' group.
usermod -aG docker ubuntu # Add the 'ubuntu' user to the 'docker' group.
systemctl restart docker
```

By adding the "jenkins" and "ubuntu" users to the "docker" group, we grant them the necessary permissions to work with Docker containers without requiring root privileges.

### Step 5 - Restart the Server

Once everything is set up, restart the Jenkins server by appending `/restart` to the Jenkins URL, like this: `http://localhost:8080/restart`.

## Configuring DockerHub and GitHub Credentials

We will set up credentials for DockerHub and GitHub to enable Jenkins to interact with these services securely.

### DockerHub

1. Go to `https://hub.docker.com/settings/security` and create a new access token.

2. In Jenkins, navigate to `http://localhost:8080/manage/credentials/store/system/domain/_/`.

3. Add a new credential with the following details:
   - Username: Use your DockerHub account username.
   - Password: Enter the access token you generated in step 1.
   - ID: Set this as `docker-cred`. Make sure to keep a note of this ID as it will be referenced in our Jenkins pipeline.

### GitHub

1. Create a personal access token on GitHub by visiting `https://github.com/settings/tokens`.

2. In Jenkins, go to `http://localhost:8080/manage/credentials/store/system/domain/_/`.

3. Create a new GitHub credential as a secret text with the following details:
   - Secret: Paste the GitHub access token you created in step 1.
   - ID: Set this as `github`. Make sure to keep a note of this ID as it will be referenced in our Jenkins pipeline.

## Writing the Jenkinsfile

We will now configure the Jenkinsfile to define our CI process. You can read this [file](./README.md) to get a comprehensive understanding of the entire CI process that we are going to configure using Jenkins.

Complete Jenkinsfile at - [Jenkinsfile](../../Jenkinsfile)

### Configuring Docker Agent as Jenkins Master

```groovy
// Configure the agent
agent {
  docker {
    // Use this image to set up the Jenkins agent
    image 'dipanshu13/python-docker:latest'
    // Mount the agent's Docker socket to access the host's Docker daemon
    args '--user root -v /var/run/docker.sock:/var/run/docker.sock'
  }
}
```

The specified Docker image includes both Docker and Python, which are essential for building and creating images of our application.

### Stage 1 - Configuring the GitHub Repository

```groovy
stage('Checkout') {
    steps {
        sh 'echo GitHub and repository and credential are already configured during pipeline configuration'
        // Uncomment the line below if we're using a direct script in the pipeline rather than a Dockerfile from a repository
        git branch: 'main', url: 'https://github.com/i-dipanshu/python-django-todo-app.git'
    }
}
```

We don't need to create any authorization to pull the repository because our repository is public. However, we need to create a way to authorize Jenkins to push to our GitHub repository.

### Stage 2: Build and Push Docker Image

```groovy
stage("Build Docker Image and Push to DockerHub") {
    environment {
        DOCKER_IMAGE = "dipanshu13/django-todo:v${BUILD_NUMBER}"
        REGISTRY_CREDENTIALS = credentials('docker-cred')
    }
    steps {
        script {
            sh "docker build -t ${DOCKER_IMAGE} ."
            // sh 'echo $REGISTRY_CREDENTIALS_PSW | docker login -u $REGISTRY_CREDENTIALS_USR --password-stdin'
            // sh 'docker push ${DOCKER_IMAGE}'
        }
    }
}
```

Note: Since this is a Python application, we don't need to build the source code. However, for compiled languages like Java, we would first compile the source code before building the Docker image.

## Stage 3: Update the Deployment File

```groovy
stage("Update the Deployment manifest") {
    environment {
        MANIFEST_GITHUB_REPO = "python-django-todo-app.git"
        GITHUB_USER_NAME = "i-dipanshu"
        EMAIL = "medipansh@gmail.com"
        NAME = "Dipanshu"
    }
    steps {
        withCredentials([string(credentialsId:"github", variable: "GITHUB_TOKEN")]) {
            sh '''
                git config user.email '${EMAIL}'
                git config user.name '${NAME}'
                sed -i "s/todo:v[0-9]\\{1,\\}/todo:v${BUILD_NUMBER}/" ./k8s-argocd-manifests/deployment.yml
                git add .
                git commit -m "Updated the deployment image to version${BUILD_NUMBER}"
                git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USER_NAME}/${MANIFEST_GITHUB_REPO} HEAD:main
            '''
        }
    }
}
```

// Setup github webhook to trigger pipeline

We can create a new job using this pipeline script in Jenkins server and github will trigger it whenever a change is made. 

---

[Previous](./README.md) | [Next](../04.%20Monitoring%20&%20Alerting/README.md)
