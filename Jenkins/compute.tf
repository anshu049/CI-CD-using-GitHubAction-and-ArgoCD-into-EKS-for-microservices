resource "aws_key_pair" "key-pair-1" {
  key_name   = "key-pair-1"
  public_key = file(var.PUBLIC_KEY_PATH)

  tags = {
    Name        = "${var.PROJECT_NAME}_key-pair"
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "instance1" {
  ami                         = "ami-0f9ce67dcf718d332"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.cidr1.id
  key_name                    = aws_key_pair.key-pair-1.id

  user_data = base64encode(templatefile("user-data-instance1.tpl", { test = "test" }))

  connection {
    user        = var.EC2_USER
    private_key = file(var.PRIVATE_KEY_PATH)
  }

  tags = {
    Name        = "${var.PROJECT_NAME}_instance1"
    Terraform   = "true"
    Environment = "dev"
  }
}