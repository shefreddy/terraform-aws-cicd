resource "aws_ecs_cluster" "dev" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "webapp" {
  family                   = var.ecs_task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.codebuild_role.arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.ecr_repo_uri
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "webapp" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.dev.id
  task_definition = aws_ecs_task_definition.webapp.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-abc123", "subnet-def456"] # Replace with your real subnet IDs
    security_groups  = ["sg-0123456789abcdef0"]           # Replace with your real security group
    assign_public_ip = true
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  depends_on = [aws_ecs_task_definition.webapp]
}
