# Docker Image Creation for Jenkins Agent

This documentation guides you through creating a Docker image customized for Jenkins agents to be used in continuous integration pipeline.

## Prerequisites

Before proceeding, ensure you have a basic understanding of the following:

- **Jenkins**: Jenkins serves as an automation server for building, testing, and deploying code. Learn more about Jenkins [here](../03.%20Jenkins/README.md).

- **Jenkins Agent**: A Jenkins agent is a worker node executing build jobs on the Jenkins master's behalf. For detailed information, refer to the [official documentation](https://www.jenkins.io/doc/book/using/using-agents/).

## Advantages of Using Docker as a Jenkins Agent

Using Docker as a Jenkins agent offers several benefits:

- **Efficient Resource Usage:** Docker runs build processes in containers that exist only during the build, conserving resources.
- **Meets Production Standards:** This approach aligns with production-grade requirements.

## Steps to Build the Docker Image

Follow these steps to create a Docker image suitable for use as a Jenkins agent:

1. **Create a Dockerfile**: Start by creating a `Dockerfile` with the following content:

```Dockerfile
# Use the latest official Ubuntu image as the base
FROM ubuntu:latest

# Update the package list and install Python
RUN apt-get update -y && apt-get install -y python3

# Install Docker
RUN apt-get update -y && apt-get install -y docker.io

# Clean up the package cache to reduce image size
RUN apt-get clean

# Set the default command to be a shell
CMD ["/bin/bash"]
```

This Dockerfile outlines the necessary steps for building the image.

2. **Build the Docker Image**: Navigate to the directory containing your Dockerfile and execute this command to build the Docker image:

```bash
docker build -t <image-name>:<version-tag> .
```

3. **Push the image to DockerHub**
Login into your DockerHub account using `docker login` command. If you don't have a DockerHub account, create one by following this [link](https://hub.docker.com/).

```sh
docker push <image-name>:<version-tag>
```

**Usage**: You can now employ this Docker image as a Jenkins agent for running the build process. It includes Python and Docker, vital for building Django applications.

[Previous](./01-Docker-Image-Django-App.md) | [Next](../02.%20Kubernetes%20&%20ArgoCD/README.md)