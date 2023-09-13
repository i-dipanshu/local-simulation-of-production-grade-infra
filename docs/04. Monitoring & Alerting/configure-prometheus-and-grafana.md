# Configure Prometheus and Grafana
We'll be using Helm to configure both prometheus and grafana.

## Configure Prometheus using Helm 

- Add Helm Repo 
    ```sh
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    ```
- Update Helm Repo 
    ```sh
    helm repo update
    ```
- Install Prometheus using Helm
    ```sh
    helm install prometheus prometheus-community/prometheus
    ```
- Expose Prometheus Server to access in our browser
    ```sh
    kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext
    ```

