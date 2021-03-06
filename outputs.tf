output "redshift_cluster_id" {
  value = "${aws_redshift_cluster.main_redshift_cluster.id}"
}

output "redshift_cluster_address" {
  value = "${replace(aws_redshift_cluster.main_redshift_cluster.endpoint, format(":%s", aws_redshift_cluster.main_redshift_cluster.port), "")}"
}

output "redshift_cluster_endpoint" {
  value = "${aws_redshift_cluster.main_redshift_cluster.endpoint}"
}

output "redshift_cluster_hosted_zone_id" {
  value = "${aws_redshift_cluster.main_redshift_cluster.hosted_zone_id}"
}

output "subnet_group_id" {
  value = "${aws_redshift_subnet_group.main_redshift_subnet_group.id}"
}

output "security_group_id" {
  value = "${aws_security_group.main_redshift_access.id}"
}

output "user_arn" {
  value = "${aws_iam_user.test_user.arn}"
}

output "user_name" {
  value = "${aws_iam_user.test_user.name}"
}

output "bucket_arn" {
  value = "${aws_s3_bucket.test_bucket.arn}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.test_bucket.id}"
}

output "iam_access_key_id" {
  value = "${aws_iam_access_key.test_user_keys.id}"
}

output "iam_access_key_secret" {
  value = "${aws_iam_access_key.test_user_keys.secret}"
}
