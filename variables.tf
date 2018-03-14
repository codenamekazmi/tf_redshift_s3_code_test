variable "cluster_identifier" {
  description = "Custom name of the cluster"
}

variable "cluster_version" {
  description = "Version of Redshift engine cluster"
  default     = "1.0"
}

variable "cluster_node_type" {
  description = "Node Type of Redshift cluster"
}

variable "cluster_number_of_nodes" {
  description = "Number of Node in the cluster"
  default     = 3
}

variable "cluster_database_name" {
  description = "The name of the database to create"
}

variable "cluster_master_username" {}

variable "cluster_master_password" {}

variable "cluster_port" {
  default = 5439
}

variable "cluster_parameter_group" {
  description = "Parameter group, depends on DB engine used"
  default     = "redshift-1.0"
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = "list"
  default     = []
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  default     = false
}

variable "subnets" {
  description = "List of subnets DB should be available at. It might be one subnet."
  type        = "list"
}

variable "private_cidr" {
  description = "VPC private addressing, used for a security group"
  type        = "list"
}

variable "redshift_vpc_id" {
  description = "VPC to connect to, used for a security group"
  type        = "string"
}

variable "skip_final_snapshot" {
  description = "If true (default), no snapshot will be made before deleting DB"
  default     = true
}

variable "preferred_maintenance_window" {
  description = "When AWS can run snapshot, can't overlap with maintenance window"
  default     = "sat:10:00-sat:10:30"
}

variable "automated_snapshot_retention_period" {
  type        = "string"
  description = "How long will we retain backups"
  default     = 0
}

variable "wlm_json_configuration" {
  default = "[{\"query_concurrency\": 5}]"
}

variable "iam_user" {}
variable "bucket_name" {}
variable "default_tags" {}
variable "kms_key_id" {}
variable "encrypted" {}
variable "vpc_id" {}
variable "env" {}
