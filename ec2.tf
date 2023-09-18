# EC2 Instance for Ansible Management Node
resource "aws_instance" "ansible_instance" {
  ami           = "ami-0df7a207adb9748c7"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type AMI ID
  instance_type = "t2.micro"
  key_name      = "hpvlong"  # Replace with your SSH key pair name

  tags = {
    Name = "ansible-management-node"
  }
}

# EC2 Instance as Target Node
resource "aws_instance" "target_instance" {
  ami           = "ami-0df7a207adb9748c7"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type AMI ID
  instance_type = "t2.micro"
  key_name      = "hpvlong"  # Replace with your SSH key pair name

  tags = {
    Name = "target-node"
  }
}