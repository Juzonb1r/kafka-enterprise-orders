resource "aws_ecs_task_definition" "order_producer" {
  family                   = "order-producer"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "order-producer"
      image     = var.container_image_producer
      essential = true
      portMappings = [{ containerPort = 8000 }]
      environment = [
        { name = "METRICS_PORT", value = "8000" }
      ]
    },
    {
      name      = "otel-collector"
      image     = "public.ecr.aws/aws-observability/aws-otel-collector:latest"
      essential = true
      command   = ["--config=/etc/ecs/otel-config.yaml"]
      environment = [
        { name = "AWS_REGION", value = var.aws_region },
        { name = "AMP_ENDPOINT", value = aws_prometheus_workspace.main.prometheus_endpoint }
      ]
      mountPoints = [{
        sourceVolume  = "otel-config"
        containerPath = "/etc/ecs"
      }]
    }
  ])

  volume {
    name = "otel-config"
    docker_volume_configuration {
      autoprovision = true
      scope         = "task"
    }
  }
}
