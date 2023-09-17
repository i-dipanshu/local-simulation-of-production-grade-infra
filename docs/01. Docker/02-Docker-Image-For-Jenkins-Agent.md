# Docker Image Creation for Jenkins Agent

This section guides you through creating a Docker image customized for Jenkins agents to be used in continuous integration pipeline.

## Prerequisites

Before proceeding, ensure you have a basic understanding of the following:

- **Jenkins**: Jenkins serves as an automation server for building, testing, and deploying code. Learn more about Jenkins [here](../03.%20Jenkins/README.md).

- **Jenkins Agent**: A Jenkins agent is a worker node executing build jobs on the Jenkins master's behalf. For detailed information, refer to the [official documentation](https://www.jenkins.io/doc/book/using/using-agents/).

## Advantages of Using Docker as a Jenkins Agent

Using Docker as a Jenkins agent offers several benefits:

- **Efficient Resource Usage:** Docker runs build processes in containers that exist only during the build, conserving resources.
- **Meets Production Standards:** This approach aligns with production-grade requirements.

## Build the Docker Image

Follow these steps to create a Docker image suitable for our application as a Jenkins agent:

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

2. **Build the Docker Image**: Navigate to the directory containing your Dockerfile and execute this command to build the Docker image:

    ```bash
    docker build -t <image-name>:<tag> .
    ```


## Push the image to DockerHub

1. **Tag the Image:**
Before pushing the image, We need to tag it with our Docker Hub username/repo. Replace `username` with our Docker Hub username and `image-name` with the name We want for our repository on Docker Hub.

    ```sh
    docker tag local-image:tag username/image-name:tag
    ```

2. **Login to Docker Hub:**
Before We can push an image to Docker Hub, We need to log in using the `docker login` command.

    ```sh
    docker login
    ```

We'll be prompted to enter our Docker Hub username and password.

3. **Push the Image:**
Once We're logged in, We can push the tagged image to Docker Hub.

    ```sh
    docker push username/image-name:tag
    ```

4. **Check on Docker Hub:**
After pushing, We can log in to our Docker Hub account through the web interface to see the pushed image in our repository.

You can now employ this Docker image as a Jenkins agent for running the build process. It includes Python and Docker, vital for building the image for our Django applications.

## Improvements
### Optimizing Container Images with Distroless Images

Efficient resource utilization in Kubernetes relies on minimizing the size of your container images. A powerful approach to achieve this is by embracing distroless images. This documentation provides clear guidance on reducing image sizes effectively using distroless images.

#### What are Distroless Images?

Distroless images are ultra-lightweight container images that exclusively comprise the essential components required for your application to run. They intentionally exclude superfluous packages and the complete operating system distribution. By adopting distroless images, you can substantially shrink the attack surface and, consequently, your overall image size.

#### Benefits of Using Distroless Images
1. **Reduced Attack Surface**
2. **Smaller Image Size**
3. **Faster Deployment**

---

[Previous](./01-Docker-Image-Django-App.md) | [Next](../02.%20Kubernetes%20&%20ArgoCD/README.md)