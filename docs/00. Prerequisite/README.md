## Prerequisites

### Concepts to Familiarize Yourself With
Before you begin, it's essential to have a basic understanding of the following concepts:

1. Minikube
2. Docker
3. Kubernetes
4. ArgoCD
5. Jenkins
6. Prometheus and Grafana
7. EFK Stack

## Setting Up an Ubuntu Instance
**Note:** This projects guide is tailored for Ubuntu instances. If you are using a different type of instance, look for commands that offer similar functionality.

To get started ensure that your instance meets the following minimum requirements:

- Minimum Memory: 8GB
- Minimum CPU: 4

## Installing Docker

1. Open a terminal on your Ubuntu instance.

2. Install Docker by running the following command:

   ```sh
   sudo apt install docker.io -y
   ```

   Verify docker installation: 

   ```sh
   docker version
   ```
   

That's it! You have successfully installed Docker on your Ubuntu instance. You can now proceed with setting up the rest of your environment using the concepts mentioned above.

[Next](./Understand-Our-Django-Application.md)