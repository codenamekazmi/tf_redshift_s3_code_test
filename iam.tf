resource "aws_iam_user" "test_user" {
  name = "${var.iam_user}_${var.bucket_name}"
}

resource "aws_iam_access_key" "test_user_keys" {
  user = "${aws_iam_user.test_user.name}"
}

