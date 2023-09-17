# Setup EFK Stack on a Kubernetes cluster 

## Clone the Repository 
    ```sh
    git clone https://github.com/i-dipanshu/local-simulation-of-production-grade-infra.git
    ```
## Change the directory to EFK manifest 
```sh
cd local-simulation-of-production-grade-infra/efk-stack-manifests
```

## Create all the resource using the resource definition manifests
```sh
kubectl apply -f . --recursive 
```
## Wait for the all the resource to get a status of running 
```sh
kubectl get all -n efl-stack
```
## Access the kibana UI
### Expose the Kibana Service 

### Open the URL in your browser

---

[Previous](./README.md) | [Next](./02-Explore-Kibana-UI.md)
