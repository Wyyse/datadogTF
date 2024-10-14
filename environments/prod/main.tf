module "datadog_monitors" {
  source = "../../modules/datadog-monitors"

  account_number = var.account_number
  account_alias  = var.account_alias

  monitor_definitions = {
    prod_linux_cpu_monitor = {
      name      = "High CPU Alert for Prod Linux Instances in account ${var.account_alias}"
      query     = "avg(last_5m):avg:aws.ec2.cpuutilization{environment:prod,os:linux,awsAccountNumber:${var.account_number}} > 80"
      message   = "CPU utilization is over 80% for host: %host% in account ${var.account_alias}. Please investigate."
      tags      = ["environment:prod", "os:linux"]
      threshold = 80
    }

    prod_linux_memory_monitor = {
      name      = "High Memory Usage for Prod Linux Instances in account ${var.account_alias}"
      query     = "avg(last_5m):avg:aws.ec2.memoryutilization{environment:prod,os:linux,awsAccountNumber:${var.account_number}} > 90"
      message   = "Memory utilization is over 90% for host: %host% in account ${var.account_alias}. Please investigate."
      tags      = ["environment:prod", "os:linux"]
      threshold = 90
    }
  }
}