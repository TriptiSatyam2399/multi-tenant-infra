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


# Infrastructure Proof & Output Screenshots

### Terraform Apply – Infrastructure Provisioned Successfully
<img width="1920" height="769" alt="Terraform (1)" src="https://github.com/user-attachments/assets/bd211dd7-2ed3-4be9-acaa-61c7f2887273" />

### Kubernetes Namespaces for Tenants
<img width="1920" height="251" alt="Namespaces" src="https://github.com/user-attachments/assets/cea08358-5602-41f4-8788-4656686703e0" />

### Tenant 1 and Tenant 2 Application Pods Running
<img width="1920" height="199" alt="tenant-pods (1)" src="https://github.com/user-attachments/assets/e0f222e1-74b8-49b8-959f-a57f3d718f8d" />

### Tenant Services (ClusterIP)
<img width="1920" height="231" alt="tenant-services (1)" src="https://github.com/user-attachments/assets/8a260db3-14dd-46c3-ab47-f36261f0d7c9" />

### Port Forwarding for Tenant 1 Application Access
<img width="1838" height="110" alt="Screenshot 2025-12-07 190830" src="https://github.com/user-attachments/assets/0dc612e0-2ec0-4d54-b561-aaf7cd462081" />

### Port Forwarding for Tenant 2 Application Access
<img width="1497" height="98" alt="Port Forwarding 2" src="https://github.com/user-attachments/assets/41dfa401-6046-4105-8121-d252841cf9e8" />

### Tenant 1 Application Access via Port Forward
<img width="1920" height="899" alt="Screenshot (418)" src="https://github.com/user-attachments/assets/ccdbfb53-2025-4495-b9ea-6ed98b4f5d2c" />

### Tenant 2 Application Access via Port Forward
<img width="1920" height="913" alt="Screenshot (419)" src="https://github.com/user-attachments/assets/27259a71-eab8-462d-9d12-57002b231f91" />

### Ingress Configuration (Configured but Not Browser-Reachable Due to WSL Networking)
<img width="1275" height="113" alt="Screenshot 2025-12-07 185557" src="https://github.com/user-attachments/assets/71a7fb82-40e1-4f21-a60b-65412a65394a" />
















