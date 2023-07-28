resource "aws_security_group" "ec2-sg" {
  name   = "${var.PROJECT_NAME}-ec2-sg1"
  vpc_id = aws_vpc.vpc1.id


  dynamic "ingress" {
    for_each = var.PORTS_EC2
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name        = "${var.PROJECT_NAME}-ec2-sg1"
    Terraform   = "true"
    Environment = "dev"
  }
}