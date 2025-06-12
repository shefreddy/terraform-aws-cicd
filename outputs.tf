# ECS Outputs
output "ecs_cluster_name" {
  value = aws_ecs_cluster.dev.name
}

output "ecs_service_name" {
  value = aws_ecs_service.webapp.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.webapp.arn
}

# VPC Outputs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}

# ALB Outputs
output "alb_dns_name" {
  value = aws_lb.webapp.dns_name
}

output "alb_listener_arn" {
  value = aws_lb_listener.http.arn
}

output "target_group_blue_arn" {
  value = aws_lb_target_group.blue.arn
}

output "target_group_green_arn" {
  value = aws_lb_target_group.green.arn
}

# IAM Roles
output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}

output "codedeploy_role_arn" {
  value = aws_iam_role.codedeploy_role.arn
}

# CodeBuild, CodePipeline, CodeDeploy
output "codebuild_project_name" {
  value = aws_codebuild_project.webapp_build.name
}

output "codepipeline_name" {
  value = aws_codepipeline.webapp_pipeline.name
}

output "codedeploy_app_name" {
  value = aws_codedeploy_app.webapp.name
}

output "codedeploy_deployment_group" {
  value = aws_codedeploy_deployment_group.webapp_group.deployment_group_name
}

# S3 Buckets
output "artifact_bucket_name" {
  value = aws_s3_bucket.codepipeline_artifacts.bucket
}

output "terraform_state_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}
