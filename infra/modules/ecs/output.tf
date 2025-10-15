output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.web.arn
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.app.name
}

output "task_execution_role_arn" {
  value = aws_iam_role.task_execution.arn
}
