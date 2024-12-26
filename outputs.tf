# Module: EFS
# Description: Terraform efs module output.

# EFS File System Outputs
output "arn" {
  value       = join("", aws_efs_file_system.default[*].arn)
  description = "EFS ARN"
}

output "id" {
  value       = join("", aws_efs_file_system.default[*].id)
  description = "EFS ID"
}

output "efs_file_system_id" {
  value       = aws_efs_file_system.default[0].id
  description = "The ID of the EFS file system."
}

output "efs_arn" {
  value       = aws_efs_file_system.default[0].arn
  description = "The ARN of the EFS file system."
}

output "efs_dns_name" {
  value       = aws_efs_file_system.default[0].dns_name
  description = "The DNS name of the EFS file system."
}

output "network_interface_ids" {
  value       = [coalescelist(aws_efs_mount_target.default[*].network_interface_id, [""])]
  description = "List of mount target network interface IDs"
}

output "efs_mount_target_ids" {
  value     = aws_efs_mount_target.default[*].id
  sensitive = true
}

# Security Group Outputs
output "tags" {
  value       = module.labels.tags
  description = "The tags of the EFS resource"
}

output "security_group_id" {
  value       = aws_security_group.default[0].id
  description = "The ID of the security group."
}

output "availability_zones" {
  value       = var.availability_zones
  description = "Availability Zones for mount targets"
}

output "security_group_arn" {
  value       = aws_security_group.default[0].arn
  description = "The ARN of the security group."
}

output "security_group_name" {
  value       = aws_security_group.default[0].name
  description = "The name of the security group."
}