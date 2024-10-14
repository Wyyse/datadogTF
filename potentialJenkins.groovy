# Add more monitors in environments/prod/main.tf

module "datadog_monitors" {
  source = "../../modules/datadog-monitors"

  monitor_definitions = {
    prod_linux_cpu_monitor = {
      name      = "High CPU Alert for Prod Linux Instances"
      query     = "avg(last_5m):avg:aws.ec2.cpuutilization{environment:prod,os:linux} > 80"
      message   = "CPU utilization is over 80% for instances tagged with environment=prod and os=linux."
      tags      = ["environment:prod", "os:linux"]
      threshold = 80
    }

    prod_linux_memory_monitor = {
      name      = "High Memory Usage for Prod Linux Instances"
      query     = "avg(last_5m):avg:aws.ec2.memoryutilization{environment:prod,os:linux} > 90"
      message   = "Memory utilization is over 90% for instances tagged with environment=prod and os=linux."
      tags      = ["environment:prod", "os:linux"]
      threshold = 90
    }
  }
}
