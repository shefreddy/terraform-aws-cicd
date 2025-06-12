# 🚀 AWS CI/CD Pipeline with ECS, CodePipeline, CodeBuild, and CodeDeploy

This project sets up a fully automated **CI/CD pipeline** using **Terraform**, deploying a containerized HTML web app from **GitHub to Amazon ECS (Fargate)** using:

- AWS **CodePipeline** (orchestrates pipeline)
- AWS **CodeBuild** (builds Docker image and pushes to ECR)
- AWS **CodeDeploy** (handles blue/green ECS deployment)
- Amazon **ECS (Fargate)** (runs the containerized web app)
- Amazon **Application Load Balancer** (handles traffic routing)
- Amazon **S3** (stores build artifacts and Terraform state)
- AWS **VPC, Subnets, Security Groups** (secure networking)

```
┌────────────────────────────┐
│        Developer           │
│  (Push code to GitHub)     │
└────────────┬───────────────┘
             │ Git Push (main/master)
             ▼
┌────────────────────────────┐
│        GitHub Repo         │
│ (Source Code + Dockerfile)│
└────────────┬───────────────┘
             │ Webhook Trigger
             ▼
┌────────────────────────────┐
│      AWS CodePipeline      │
│     [CI/CD Orchestration]  │
└────────────┬───────────────┘
             │
             ▼
┌────────────────────────────┐
│       Source Stage         │
│   GitHub → Artifact.zip    │
└────────────┬───────────────┘
             │
             ▼
┌────────────────────────────┐
│        Build Stage         │
│      AWS CodeBuild         │
│ ─────────────────────────  │
│ - Build Docker image       │
│ - Authenticate with ECR    │
│ - Push image to ECR        │
│ - Output imagedefinitions.json │
└────────────┬───────────────┘
             │
             ▼
┌────────────────────────────┐
│       Deploy Stage         │
│      AWS CodeDeploy        │
│ ─────────────────────────  │
│ - ECS Blue/Green deploy    │
│ - AppSpec + TaskDef        │
│ - Uses imagedefinitions.json│
└────────────┬───────────────┘
             │
             ▼
┌────────────────────────────┐
│     Amazon ECS (Fargate)   │
│ ─────────────────────────  │
│ - Blue/Green Deployment    │
│ - Amazon ALB Switching     │
└────────────────────────────┘
```

## 📁 Project Structure
```
terraform/
├── static-app                  
├── variables.tf                   
├── outputs.tf               
├── s3.tf          
├── vpc.tf
├── main.tf                  
├── variables.tf                   
├── outputs.tf               
├── scs.tf
├── iam.tf                  
├── codepipeline.tf                   
├── codedeploy.tf               
├── codebuild.tf          
└── README.md   
```


## 📂 GitHub Repo Files

- `buildspec.yml` — CodeBuild config
- `appspec.yaml` — CodeDeploy ECS deployment config
- `ecs-task-def.json` — Optional standalone ECS task definition template

```

## 🛠 Prerequisites

- AWS account with appropriate IAM permissions
- Terraform ≥ 1.3
- AWS CLI configured
- GitHub repository with:
  - Dockerfile for your HTML app
  - `buildspec.yml` and `appspec.yaml`
- GitHub OAuth Token (for CodePipeline access)

```

## 🚀 How to Deploy

### 1. Clone this repo

```bash
git clone https://github.com/shefreddy/terraform-aws-cicd.git
cd your-repo/terraform-aws-cicd
```

## 👨‍💻 Author

Built with ❤️ using Terraform and AWS.

Author: Freddy Shema

📌 Official Website: https://awscloudguy.com
📌 GitHub Profile: https://github.com/shefreddy

