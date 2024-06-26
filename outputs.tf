#Module      : EFS
#Description : Terraform efs module output.
output "arn" {
  value       = join("", aws_efs_file_system.default[*].arn)
  description = "EFS ARN"
}

output "id" {
  value       = join("", aws_efs_file_system.default[*].id)
  description = "EFS ID"
}

output "mount_target_ids" {
  value       = [coalescelist(aws_efs_mount_target.default[*].id, [""])]
  description = "List of EFS mount target IDs (one per Availability Zone)"
}

output "mount_target_ips" {
  sensitive   = true
  value       = [coalescelist(aws_efs_mount_target.default[*].ip_address, [""])]
  description = "List of EFS mount target IPs (one per Availability Zone)"
}

output "network_interface_ids" {
  value       = [coalescelist(aws_efs_mount_target.default[*].network_interface_id, [""])]
  description = "List of mount target network interface IDs"
}

output "tags" {
  value       = module.labels.tags
  description = "The tags of the ecs cluster"

}