# Simulating a Production-Grade Infrastructure Locally

Have you ever been curious about how Google handles an infrastructure that can handle a staggering 8.5 billion searches daily ?

This project aims to help you understand the foundation of such environment by guiding you through the process of creating, designing, and managing a production-ready infrastructure right on your own computer. It transforms a simple application into a robust deployment within a Kubernetes environment, automates application updates using Jenkins and Argo CD, offers user-friendly monitoring dashboards with Prometheus and Grafana, and provides log management and analysis with the EFK stack.

**Note:** It's important to keep in mind that this project offers a high-level overview of a production-level infrastructure, providing foundational knowledge only. In reality, production infrastructures are often much more complex and larger.

## **Purpose**

The primary aim of this project is to provide an practical learning experience, helping you gain valuable insights into the requirements and complexities of designing, creating and managing production-grade infrastructure. By actively engaging with this project, you'll develop a deep understanding of the essential prerequisites for deploying and maintaining enterprise-level infrastructure.

## **Project Deliverables**

This project lets you simulate a high-level production-grade infrastructure on your local. This includes:

1. **Deployment of a Django CRUD Application**
2. **Argo CD for Continuous Deployment**
3. **Continuous Integration with Jenkins**
4. **Monitoring with Prometheus and Grafana**
5. **Managing and analyzing Logs using EFK Stack**

## The Implementation

For understanding what are these enterprise-level requirements, please refer to the [Project Documentation](./docs/README.md).

### Architecture Diagram
<!-- todo -->

### The Flow of Docs
Each stage has two types of documentation. One provides information about the tools or technologies, explaining why they are needed, and the other is a guide to implement them.

Note: Due to limited computing resources, we'll use a scaled-down version of all the components. Sometimes we may need to ignore some security measures. However, look for heading appended with <Production> to learn what would change in a real production environment.

### The Flow of the Project

This  project is divided into 5 stages. We'll delve into one stage at a time.


| Stage        | Deliverables                                      | Tools                          | Steps                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------ | ------------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Prerequisite | Install Docker                                    | Linux, Docker                  | [01. Prerequisite](./docs/00.%20Prerequisite/README.md) <br> [02. Understand Our Django Application](./docs/00.%20Prerequisite/Understand-Our-Django-Application.md)                                                                                                                                                                                                                                                    |
| Stage 1      | Build Docker Images                               | Docker                         | [01.Understand Docker Stage](./docs/01.%20Docker/README.md) <br> [02. Build Docker Image For Django App](./docs/01.%20Docker/01-Docker-Image-Django-App.md) <br> [03. Build Docker Image For Jenkins agent](./docs/01.%20Docker/02-Docker-Image-For-Jenkins-Agent.md)                                                                                                                                                   |
| Stage 2      | Setup continuous deployment using ArgoCD          | Argo CD, Kubernetes            | [01. Understand Kubernetes and Continuous Deployment stage](./docs/02.%20Kubernetes%20&%20ArgoCD/README.md) <br> [02. Configure k8s Cluster](./docs/02.%20Kubernetes%20&%20ArgoCD/01.%20Configure-k8s-cluster.md) <br> [03. Configure ArgoCD](./docs/02.%20Kubernetes%20&%20ArgoCD/02.%20Configure-argocd.md) <br> [04. Deploy app using ArgoCD](./docs/02.%20Kubernetes%20&%20ArgoCD/03.%20Deploy-app-using-argocd.md) |
| Stage 3      | Setup continuous integration using Jenkins        | Jenkins Server                 | [01. Understand Continuous Integration Stage](./docs/03.%20Jenkins/README.md) <br> [02. Setup Continuous Integration Pipeline](./docs/03.%20Jenkins/jenkins-setup-for-ci.md)                                                                                                                                                                                                                                            |
| Stage 4      | Setup monitoring using Prometheus and Grafana     | Prometheus, Grafana            | [01. Understand Monitoring Stage](./docs/04.%20Monitoring%20&%20Alerting/README.md) <br> [02. Configure Prometheus and Grafana on K8s cluster](./docs/04.%20Monitoring%20&%20Alerting/01.%20Install-Prometheus-Grafana.md) <br> [03. Setup Grafana Dashboard](./docs/04.%20Monitoring%20&%20Alerting/02-Setup-Grafana-Dashboards.md) <br> [04. Setup Alerts](./docs/04.%20Monitoring%20&%20Alerting/03-Setup-Alerts.md) |
| Stage 5      | Setup log management and analysis using EFK Stack | Elasticsearch, Fluentd, Kibana | [01. Understand Log management and analysis stage](./docs/05.%20EFK/README.md) <br> [02. Configure EFK stack on K8s cluster](./docs/05.%20EFK/01-Setup-EFK-Stack.md) <br> [03. Explore and understand Kibana UI](./docs/05.%20EFK/02-Explore-Kibana-UI.md)                                                                                                                                                              |

## Contributions
Explore the documentation for the a section with heading `Improvements`. These are areas where contributions can be made to enhance the project. You can add detailed step-by-step guides for implementation. If you have suggestions or find issues, feel free to add them and create a pull request.

## Need Help?
If you need assistance or have questions, don't hesitate to contact me through [LinkedIn](https://www.linkedin.com/in/i-dipanshu).
