#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. `app`"
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "label order, e.g. `name`,`application`"
}

variable "managedby" {
  type        = string
  default     = "info@cypik.com"
  description = "ManagedBy, eg 'info@cypik.com'."
}

# Module      : EFS
# Description : Terraform EFS  module variables.
variable "security_groups" {
  type        = list(string)
  sensitive   = true
  description = "Security group IDs to allow access to the EFS"
}
variable "from_port" {
  type        = number
  default     = 2049
  description = "Security group IDs to allow access to the EFS"
}

variable "to_port" {
  type        = number
  default     = 2049
  description = "Security group IDs to allow access to the EFS"
}

variable "egress_from_port" {
  type        = number
  default     = 0
  description = "Security group IDs to allow access to the EFS"
}
variable "egress_to_port" {
  type        = number
  default     = 0
  description = "Security group IDs to allow access to the EFS"
}

variable "protocol" {
  type        = string
  default     = "tcp"
  description = "Security group IDs to allow access to the EFS"
}

variable "egress_protocol" {
  type        = number
  default     = -1
  description = "Security group IDs to allow access to the EFS"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Security group IDs to allow access to the EFS"
}

variable "efs_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}
variable "replication_enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "creation_token" {
  type        = string
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the EFS"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where subnets will be created"
}

variable "availability_zones" {
  type        = list(string)
  sensitive   = true
  description = "List of availability zones for subnets"
}

variable "encrypted" {
  type        = bool
  default     = true
  description = "If true, the file system will be encrypted"

}

variable "performance_mode" {
  type        = string
  default     = "generalPurpose"
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`"

}

variable "provisioned_throughput_in_mibps" {
  type        = string
  default     = 0
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to provisioned"
}

variable "throughput_mode" {
  type        = string
  default     = "bursting"
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
}

variable "mount_target_ip_address" {
  type        = string
  default     = null
  sensitive   = true
  description = "The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target"
}

variable "subnet_ids" {
  description = "List of subnet IDs, one for each availability zone."
  type        = list(string)
}

variable "kms_key_id" {
  type        = string
  default     = ""
  sensitive   = true
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
}

variable "efs_backup_policy_enabled" {
  type        = bool
  default     = true
  description = "If `true`, it will turn on automatic backups."
}

variable "allow_cidr" {
  type        = list(any)
  default     = []
  description = "Provide allowed cidr to efs"
}

variable "access_point_enabled" {
  type    = bool
  default = true
}

variable "mount_target_description" {
  type    = string
  default = "this is mount target security group "
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  default     = false
  description = "A flag to indicate whether to bypass the `aws_efs_file_system_policy` lockout safety check. Defaults to `false`"
}

variable "enable_aws_efs_file_system_policy" {
  type        = bool
  default     = false
  description = "A flag to enable or disable aws efs file system policy . Defaults to `false`"
}

variable "replication_configuration_destination" {
  type        = any
  default     = {}
  description = "A destination configuration block"
}

variable "source_policy_documents" {
  type        = list(string)
  default     = []
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
}

variable "override_policy_documents" {
  type        = list(string)
  default     = []
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
}

variable "policy_statements" {
  type        = any
  default     = []
  description = "A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
}

variable "deny_nonsecure_transport" {
  type        = bool
  default     = false
  description = "Determines whether `aws:SecureTransport` is required when connecting to elastic file system"
}

variable "access_point_secondary_gids" {
  type        = list(number)
  default     = []
  description = "A list of secondary group IDs for the POSIX user for the access point."
}

variable "creation_permissions" {
  type        = string
  default     = "755" # You can set a default value if appropriate
  description = "Permissions for the root directory of the EFS access point."
}

variable "access_point_uid" {
  type        = number
  default     = 1001 # Change as necessary
  description = "User ID for the EFS access point."
}

variable "creation_owner_gid" {
  type        = number
  default     = 1001 # Change as necessary
  description = "Group ID for the owner of the EFS access point."
}

variable "creation_owner_uid" {
  type        = number
  default     = 1000 # Change as necessary
  description = "User ID for the owner of the EFS root directory."
}

variable "access_point_gid" {
  type        = number
  default     = 1001 # Change as necessary
  description = "Group ID for the EFS access point."
}

variable "root_directory_path" {
  type        = string
  default     = "/" # Change as necessary
  description = "Root directory path for the EFS access point."
}