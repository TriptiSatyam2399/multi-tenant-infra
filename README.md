# multi-tenant-infra
Multi-Tenant Kubernetes Infrastructure using Terraform:

This project shows how I built a multi-tenant setup on Kubernetes using Terraform. The idea is simple: run multiple tenants (Tenant 1 and Tenant 2) on the same Kubernetes cluster, but keep them logically isolated using namespaces.

Everything is created using Terraform (Infrastructure as Code) and tested locally using Minikube on WSL (Windows).

# Multi-Tenant Kubernetes Infrastructure using Terraform

This project shows how I built a multi-tenant setup on Kubernetes using Terraform. The idea is simple: run multiple tenants (Tenant 1 and Tenant 2) on the same Kubernetes cluster, but keep them logically isolated using namespaces.

Everything is created using Terraform (Infrastructure as Code) and tested locally using Minikube on WSL (Windows).


# What This Project Does

* Creates separate namespaces for each tenant
* Deploys an Nginx app for each tenant
* Exposes each app using a Kubernetes Service
* Uses Terraform modules for clean and reusable code
* Follows proper Git hygiene using `.gitignore`
* Fully tested and accessible in the browser using port-forwarding


# How the Architecture Works

One Kubernetes Cluster
│
├── tenant1 namespace
│    ├── nginx deployment
│    └── tenant1 service
│
└── tenant2 namespace
     ├── nginx deployment
     └── tenant2 service

Each tenant is isolated using its own namespace, but both are managed from the same Terraform project.


# Project Structure
.
├── .gitignore
├── README.md
├── versions.tf
├── envs/
│   └── dev/
│       ├── main.tf
│       └── providers.tf
└── modules/
    └── tenant/
        ├── main.tf
        ├── outputs.tf
        └── variables.tf

# Prerequisites

Before running this project, make sure you have:

* Git
* Terraform
* Docker
* Kubectl
* Minikube
* WSL (if you are on Windows)

# How to Run This Project

# 1. Start Minikube
command : minikube start

# 2. Initialize Terraform
command : 
cd envs/dev
terraform init

# 3. Apply Terraform
command : terraform apply -auto-approve

This automatically creates both tenant environments.

# 4. Verify Everything Is Running
commands:
kubectl get ns
kubectl get pods -n tenant1
kubectl get pods -n tenant2
kubectl get svc -n tenant1
kubectl get svc -n tenant2

You should see both tenants running successfully.

# 5. Open the Applications in the Browser
Since this setup runs on Minikube inside WSL, the safest way to access the apps from Windows is using port-forwarding.

# Tenant 1
command : 
kubectl port-forward -n tenant1 svc/tenant1-svc 9101:80

Then open in your browser:
http://localhost:9101

# Tenant 2
command : 
kubectl port-forward -n tenant2 svc/tenant2-svc 9102:80

Then open in your browser:
command : 
http://localhost:9102

You will see the NGINX welcome page for both tenants.

# Cleanup
To delete everything created by Terraform:
command : 
terraform destroy -auto-approve

# Best Practices Followed

* Terraform state files are not committed
* `.terraform` folder is ignored
* Provider binaries are excluded
* Cleaned Git history with meaningful commits


This project is fully working and verified in a real browser using Kubernetes port-forwarding.


