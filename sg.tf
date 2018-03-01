resource "aws_security_group" "main_redshift_access" {
  name        = "${var.cluster_identifier}-redshift"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "${var.cluster_identifier}-redshift"
  }
}

resource "aws_security_group_rule" "allow_port_inbound" {
  type = "ingress"
  from_port   = "${var.cluster_port}"
  to_port     = "${var.cluster_port}"
  protocol    = "tcp"
  cidr_blocks = ["${var.private_cidr}"]
  security_group_id = "${aws_security_group.main_redshift_access.id}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.main_redshift_access.id}"
}
