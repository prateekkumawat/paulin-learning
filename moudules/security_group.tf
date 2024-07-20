# create security group for frontend servers
resource "aws_security_group" "frontend" {
  name        = "project-batch-devops-feserver"
  description = "Security Group for FE servers"
  vpc_id = aws_vpc.devproject.id

    ingress {
      description = "Allow port HTTP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    description = "Allow ALL ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}