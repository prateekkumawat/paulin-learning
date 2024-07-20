# create a frontend server Instance 
resource "aws_instance" "frontendservers1" {
  ami = var.aws_ami
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.publicsubnet1.id
  security_groups = [aws_security_group.frontend.id]
  key_name = aws_key_pair.feserver_key_pair.key_name
  tags = {
    Name = "project-batch-devops-feserver-az1"
  }
}