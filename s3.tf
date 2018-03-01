
resource "aws_s3_bucket" "test_bucket" {
  bucket        = "${var.bucket_name}"
  acl           = "private"
  force_destroy = "true"

  tags {
    Name        = "${var.bucket_name}"
    Environment = "${var.env}"
  }
}

resource "aws_s3_bucket_policy" "test_user_bucket_policy" {
  bucket = "${aws_s3_bucket.test_bucket.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_user.test_user.arn}"
      },
      "Action": [ "s3:*" ],
      "Resource": [
        "${aws_s3_bucket.test_bucket.arn}",
        "${aws_s3_bucket.test_bucket.arn}/*"
      ]
    }
  ]
}
}
