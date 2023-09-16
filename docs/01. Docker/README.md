## What is Docker?
Docker is a platform that enables developers to develop, package, and distribute applications as lightweight, portable containers. These containers are isolated from the host system, ensuring consistent behavior across different environments.
You can learn more about Docker in the official [documentation](https://docs.docker.com/get-started/overview/).

## How Docker Helps Achieve Production-Grade Requirements
Docker plays a crucial role in achieving production-grade requirements by:
- **Consistency**
- **Scalability**
- **Ease of Deployment**
- **Resource Efficiency**
- **Version Management**
  
## Installing Docker
Before proceeding, ensure that you have Docker installed. You can verify the installation by running the following command:
```
docker --version
```
If docker is not installed, run the below command to install docker:
```sh
sudo apt install docker.io -y
```
## Building Required Docker Images
Before continuing to next stages, you'll need to build specific Docker images. Follow these steps:
1. [Create a Docker Image for the Django App](./01-Docker-Image-Django-App.md)
2. [Build a Docker Image for the Jenkins Agent](./02-Docker-Image-For-Jenkins-Agent.md)

[Previous](../00.%20Prerequisite/Understand-Our-Django-Application.md) | [Next](./01-Docker-Image-Django-App.md)

