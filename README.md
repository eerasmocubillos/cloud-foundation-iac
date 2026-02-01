# CloudFoundation - Infrastructure as Code (IaC)

This repository serves as the core infrastructure layer for the Cloud/DevOps Roadmap. It utilizes Terraform to provision simulated AWS resources within a LocalStack environment, enabling secure and cost-effective testing of deployment patterns and security audits.

## 🎯 Project Objectives
1. Standardize infrastructure deployment using HCL (HashiCorp Configuration Language).
2. Enable local cloud emulation to eliminate AWS consumption costs during development.
3. Provision specific security scenarios (Public vs. Private Buckets) to validate the CloudVigilante auditor.

## 🛠️ Technical Stack
* Terraform: Used for resource lifecycle management.
* LocalStack: Provides a local AWS-compatible API for S3 and STS.
* Docker: Hosts the LocalStack container environment.

## 📂 Repository Structure
* providers.tf: Configuration for the AWS provider and LocalStack endpoint mapping.
* main.tf: Declarative resource definitions for S3 buckets and access policies.
* variables.tf: Centralized input parameters for environment-specific configurations.

## 🚀 Deployment Guide

### Prerequisites
* Docker Desktop (Running)
* Terraform CLI (v1.0.0+)
* AWS CLI (Configured with dummy 'test' credentials)

### Step-by-Step Execution
1. Initialize LocalStack:
   docker run -d -p 4566:4566 localstack/localstack

2. Initialize Terraform:
   terraform init

3. Execution Plan:
   terraform plan

4. Apply Infrastructure:
   terraform apply -auto-approve

## 🔍 Validation
Verify the infrastructure state via the AWS CLI:
aws --endpoint-url=http://localhost:4566 s3 ls