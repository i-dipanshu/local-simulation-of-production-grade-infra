# What is Jenkins

Jenkins is an open-source automation server that facilitates the Continuous Integration (CI) and Continuous Deployment (CD) processes. It is designed to automate various stages of software development, including building, testing, and deploying applications. Jenkins allows us to automate repetitive tasks, ensuring code quality and faster delivery.

# Why Jenkins

Jenkins is a popular choice for CI/CD for several reasons:

- **Flexibility**: Jenkins supports a wide range of plugins and integrations, making it adaptable to various project requirements and technologies.

- **Open Source**: Being open-source means Jenkins is free to use, and a vast community actively supports and extends its functionality.

- **Extensive Plugin Ecosystem**: Jenkins boasts a rich ecosystem of plugins that can be leveraged to integrate with a variety of tools and services.

- **Customization**: Jenkins provides flexibility in defining custom build and deployment pipelines to suit the needs of different projects.

- **Scalability**: Jenkins can scale horizontally to handle large and complex CI/CD workflows.

# Our CI that Jenkins Needs to Perform

Let's delve into our CI process to understand how Jenkins plays a crucial role.

## CI Process Overview

Our source code resides in the root directory of our project. Whenever changes are made to this source code, GitHub triggers a Jenkins pipeline using a GitHub webhook.

## Jenkins Pipeline Steps

The Jenkins pipeline is responsible for automating the following steps:

### 1. Building and Packaging

Jenkins takes the new and updated code and initiates a build process.

### 2. Creating Docker Image

After successfully building the application, Jenkins creates a new Docker image of the updated code. This image is tagged with a version identifier.

### 3. Pushing to DockerHub

The newly created Docker image is then pushed to DockerHub, a container image repository, making it accessible for deployment across environments.

### 4. Updating Kubernetes Deployment

In our Kubernetes (K8s) deployment definition file, Jenkins updates the image option to reference the newly created Docker image with the version tag. This ensures that the latest version of our application is deployed in our Kubernetes cluster.

## Improvements 
- We can configure slack notification whenever a test is passed or failed during our CI process. 
- We can setup a stage for sonar server for code analysis.
- We could also use build with parameter in Jenkins to improve reusability and management.

---

[Previous](../02.%20Kubernetes%20&%20ArgoCD/03.%20Deploy-app-using-argocd.md) | [Next](./jenkins-setup-for-ci.md)

