# Installing Helm in our Minikube Cluster

Follow these straightforward steps to install Helm on your Minikube cluster:

### Step 1: Start Minikube Cluster

Ensure your Minikube cluster is up and running by executing the following command:

```shell
minikube start
```

### Step 2: Install Helm

To install Helm, you can use a convenient shell script provided by the Helm project. Execute these commands:

```shell
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh
```

This script will download and install Helm version 3.

### Step 3: Verify Helm Installation

To confirm that Helm was installed successfully, run:

```shell
helm version
```

This command should display Helm's version and other information if the installation was successful.

Helm is now installed on your Minikube cluster.