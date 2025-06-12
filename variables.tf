variable "region" {
  default = "us-east-1"
}

variable "ecr_repo_uri" {
  default = "384434040204.dkr.ecr.us-east-1.amazonaws.com/dev"
}

variable "ecs_cluster_name" {
  default = "devcluster"
}

variable "ecs_service_name" {
  default = "webapp-service"
}

variable "ecs_task_family" {
  default = "webapp"
}

variable "container_name" {
  default = "webapp"
}

variable "github_repo" {
  default = "your-username/your-repo"
}

variable "github_branch" {
  default = "main"
}

variable "github_oauth_token" {
  description = "GitHub OAuth token with repo access"
}
