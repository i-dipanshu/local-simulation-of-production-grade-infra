## What is Docker?
Docker is a platform that enables developers to develop, package, and distribute applications as lightweight, portable containers. These containers are isolated from the host system, ensuring consistent behavior across different environments.
You can learn more about Docker in the official [documentation](https://docs.docker.com/get-started/overview/).

## How Docker Helps Achieve Production-Grade Requirements
Docker plays a crucial role in achieving production-grade requirements by:
- **Consistency**: Ensuring consistent behavior of applications in development, testing, and production environments.
- **Scalability**: Enabling horizontal scaling of applications to meet increasing user demand.
- **Ease of Deployment**: Simplifying the deployment process, reducing errors, and minimizing downtime.
- **Resource Efficiency**: Optimizing resource usage, making efficient use of hardware.
- **Version Management**: Allowing for easy versioning and rollback of applications.
  
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
To continue with your Docker journey, you'll need to build specific Docker images for your applications. Follow these steps:
1. [Create a Docker Image for the Django App](./01-Docker-Image-Django-App.md)
2. [Build a Docker Image for the Jenkins Agent](./02-Docker-Image-For-Jenkins-Agent.md)

That's it! You're now ready to leverage the power of Docker for your DevOps projects.

[Previous](../00.%20Prerequisite/Understand-Our-Django-Application.md) | [Next](./01-Docker-Image-Django-App.md)

