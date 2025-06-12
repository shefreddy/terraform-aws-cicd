output "pipeline_name" {
  value = aws_codepipeline.webapp_pipeline.name
}

output "ecs_service" {
  value = aws_ecs_service.webapp.name
}
