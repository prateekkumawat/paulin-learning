# Define key for frontend server 
resource "tls_private_key" "feserver_key" {
  algorithm = "RSA"
  rsa_bits  = 4096 
}
resource "aws_key_pair" "feserver_key_pair" {
  key_name   = "feserver.pem"
  public_key = tls_private_key.feserver_key.public_key_openssh
}
resource "local_file" "feserverkey" {
   filename = "feserverkey.pem"
   content = tls_private_key.feserver_key.private_key_pem
}


