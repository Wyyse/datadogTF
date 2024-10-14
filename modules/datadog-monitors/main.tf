resource "datadog_monitor" "aws_resource_monitor" {
  for_each = var.monitor_definitions

  name    = each.value["name"]
  type    = "metric alert"
  query   = each.value["query"]
  message = each.value["message"]

  tags = each.value["tags"]

  thresholds {
    critical = each.value["threshold"]
  }

  notify_no_data  = true
  renotify_interval = 60
  evaluation_delay = 300
  timeout_h        = 0
}
