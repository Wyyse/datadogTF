output "monitor_ids" {
  value = datadog_monitor.aws_resource_monitor[*].id
}