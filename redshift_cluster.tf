resource "aws_redshift_cluster" "main_redshift_cluster" {
  cluster_identifier = "${var.cluster_identifier}"
  cluster_version    = "${var.cluster_version}"
  node_type          = "${var.cluster_node_type}"
  number_of_nodes    = "${var.cluster_number_of_nodes}"
  database_name      = "${var.cluster_database_name}"
  master_username    = "${var.cluster_master_username}"
  master_password    = "${var.cluster_master_password}"

  port = "${var.cluster_port}"

  vpc_security_group_ids = ["${aws_security_group.main_redshift_access.id}"]

  cluster_subnet_group_name    = "${aws_redshift_subnet_group.main_redshift_subnet_group.name}"
  cluster_parameter_group_name = "${aws_redshift_parameter_group.main_redshift_cluster.id}"
  publicly_accessible          = "${var.publicly_accessible}"

  skip_final_snapshot                 = "${var.skip_final_snapshot}"
  automated_snapshot_retention_period = "${var.automated_snapshot_retention_period }"
  preferred_maintenance_window        = "${var.preferred_maintenance_window}"

  iam_roles = ["${var.cluster_iam_roles}"]

  lifecycle {
    prevent_destroy = true
  }

  tags       = "${var.default_tags}"
  encrypted  = "${var.encrypted}"
  kms_key_id = "${var.kms_key_id}"
}
