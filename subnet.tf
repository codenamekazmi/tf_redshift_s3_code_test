resource "aws_redshift_parameter_group" "main_redshift_cluster" {
  name   = "${var.cluster_identifier}-${replace(var.cluster_parameter_group, ".", "-")}-custom-params"
  family = "${var.cluster_parameter_group}"

  parameter {
    name  = "wlm_json_configuration"
    value = "${var.wlm_json_configuration}"
  }
}

resource "aws_redshift_subnet_group" "main_redshift_subnet_group" {
  name        = "${var.cluster_identifier}-redshift-subnetgrp"
  description = "Redshift subnet group of ${var.cluster_identifier}"
  subnet_ids  = ["${var.subnets}"]
}
