provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "ssm_role" {
  name = "ec2_ssm_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_instance" "linux" {
  ami           = "ami-000ec6c25978d5999" # Use latest Amazon Linux 2 AMI
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name       = "patch-demo"
    "Patch Group" = "LinuxTestGroup"
  }
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ec2_ssm_profile"
  role = aws_iam_role.ssm_role.name
}
