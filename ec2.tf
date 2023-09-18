# EC2 Instance for Ansible Management Node
resource "aws_instance" "ansible_instance" {
  ami           = "ami-0df7a207adb9748c7"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type AMI ID
  instance_type = "t2.micro"
  key_name      = "hpvlong"  # Replace with your SSH key pair name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id] # Security Group for SSH
  tags = {
    Name = "ansible-management-node"
  }
}

# EC2 Instance as Target Node
resource "aws_instance" "target_instance" {
  ami           = "ami-0df7a207adb9748c7"  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type AMI ID
  instance_type = "t2.micro"
  key_name      = "hpvlong"  # Replace with your SSH key pair name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id] # Security Group for SSH
  tags = {
    Name = "target-node"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow-ssh-"

  # Ingress rules (inbound traffic)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (not recommended for production)
  }

  # Egress rules (outbound traffic)
  egress {
    from_port   = 0            # Allow traffic from any port
    to_port     = 0            # Allow traffic to any port
    protocol    = "-1"         # Allow all protocols (TCP, UDP, ICMP, etc.)
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic to go anywhere (the internet)
  }
  tags = {
    Name = "allow_ssh-and-internet"
  }
}