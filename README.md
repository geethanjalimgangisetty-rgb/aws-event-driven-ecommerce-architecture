# aws-event-driven-ecommerce-architecture
This repository contains the architecture and infrastructure code for a scalable, event-driven e-commerce system built on AWS. Designed to handle high-throughput order processing and real-time inventory management, the system leverages asynchronous messaging to decouple microservices, improve fault tolerance, and optimize resource utilization.
---

## 💡 Solutions Architecture Highlights & Trade-off Analysis

### 1. Asynchronous Decoupling & Resilience
* **EventBridge + SQS Fan-Out Pattern:** Decouples ingestion from downstream operations (payments, email notifications) so traffic spikes do not drop orders.
* **Dead Letter Queues (DLQs) & Self-Healing:** Each processing queue attaches a dedicated DLQ with exponential retry policies. Failed executions emit CloudWatch metrics to trigger alarms.

### 2. Modern Zero-Trust & Identity Governance
* **OIDC Passwordless CI/CD:** Replaced static AWS access keys in GitHub Secrets with short-lived STS tokens dynamically requested via **GitHub Actions OpenID Connect (OIDC)** federated identity.
* **Least-Privilege Execution:** IAM Roles are scoped strictly per service component (e.g., Worker Lambdas can only execute `TransactWriteItems` on specific DynamoDB partition keys).

### 3. Advanced Cost & Resource Optimization
* **DynamoDB Single-Table Design:** Utilized single-table NoSQL modeling to minimize provisioned IOPS over-allocation and optimize query performance.
* **Serverless Compute & Gateway Endpoints:** Leveraged AWS Lambda on-demand execution alongside S3/DynamoDB Gateway VPC Endpoints to eliminate unnecessary NAT Gateway transfer charges.

---

## 🛠 Tech Stack & DevOps Tooling

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Cloud Provider** | **AWS** | API Gateway, EventBridge, SQS, Lambda, DynamoDB, S3, IAM, CloudWatch |
| **Infrastructure as Code** | **Terraform** | Declarative IaC, Modular Architecture, Remote S3 State & DynamoDB Locking |
| **CI/CD Pipeline** | **GitHub Actions** | Automated `terraform fmt`, `validate`, `plan`, and OIDC deployment |
| **Application Runtime** | **Node.js / TypeScript** | AWS SDK v3, Strongly typed serverless handlers |
| **Security & Compliance** | **AWS IAM OIDC** | Short-lived STS temporary credentials for pipeline runs |

---

## 🚀 Repository Structure

### Prerequisites
Ensure the following CLI binaries are installed on your workstation:
* [Git](https://git-scm.com/)
* [AWS CLI v2](https://aws.amazon.com/cli/) (`aws --version`)
* [Node.js (LTS)](https://nodejs.org/) & `npm` (`node -v`)
* [TypeScript Compiler](https://www.typescriptlang.org/) (`tsc -v`)
* [Terraform CLI](https://www.developer.hashicorp.com/terraform) (`terraform -v`)