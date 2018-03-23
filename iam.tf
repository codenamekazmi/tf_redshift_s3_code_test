resource "aws_iam_role" "test" {
  name   = "test-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
} EOF
}

resource "aws_iam_policy" "policy-test" {
  name    = "test-policy"
  description = "This is a policy for the s3 bucket created"
  policy   = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${var.bucket_name}"]
    },
    {
      "Effect": "Allow",
      "Action": ["s3:PutObject",
                 "s3:GetObject",
                 "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${var.bucket_name}/*"]
    }
  ]
} EOF
}

resource "aws_iam_policy_attachment" "att-test" {
  name = "test-attach"
  roles = ["${aws_iam_role.test.name}"]
  policy_arn = "${aws_iam_policy.policy-test.arn}"
}

