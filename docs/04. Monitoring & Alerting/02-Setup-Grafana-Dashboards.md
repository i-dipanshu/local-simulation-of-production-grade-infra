# Kubernetes Monitoring with Grafana 

## Login to Grafana

To access Grafana, follow these steps:

1. Use `admin` as both the username and password to log in.
2. Create a new password when prompted.
3. Explore the Grafana UI to familiarize yourself with its features.

## Import Dashboards

You can import pre-built dashboards from the Grafana community to monitor your cluster and deployments. Find these dashboards at [Grafana Dashboards](https://grafana.com/grafana/dashboards/).

### How to Import a Dashboard

1. Go to [Grafana Dashboards](https://grafana.com/grafana/dashboards/).
2. Open the desired dashboard.
3. Copy the dashboard ID.
4. Paste the ID at `http://localhost:3000/dashboard/import`.

## Node Full Exporter - Monitor Cluster State

To monitor your cluster's state using the Node Full Exporter dashboard:

1. Visit `http://localhost:3000/dashboard/import`.
2. Fill in the ID field with `1860`.


Read More about [Node Full Exporter](https://grafana.com/grafana/dashboards/1860-node-exporter-full/)

This dashboard displays metrics exported by Prometheus Node Exporter, a resource created during the installation of prometheus. This metrics includes: 

- CPU Usage
- System Load
- RAM Usage
- Uptime
- Total Root File System
- Total RAM
- Total SWAP
- SWAP Usage
- Root File System Usage
- CPU Cores

## ArgoCD - Monitor ArgoCD and Application Deployment

To monitor ArgoCD and your application deployment using the ArgoCD dashboard:

1. Go to [ArgoCD Dashboard](https://grafana.com/grafana/dashboards/14584-argocd/) and learn about ArgoCD dashboard.
2. Copy the dashboard ID ie; `14584`.
3. Create a new dashboard with the above ID at `http://localhost:3000/dashboard/import`.

This dashboard monitors:

1. Application Health
2. Application Sync Health
3. Controller Stats
4. Other ArgoCD-related resources

---

[Previous](./01.%20Install-Prometheus-Grafana.md) | [Next](./03-Setup-Alerts.md)
