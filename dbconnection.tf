/* resource "aws_security_group" "WebaapProjectSG_Database" {
  name        = "allow_ssh_database"
  description = "Allow SS inbound traffic_database"
  vpc_id      = aws_vpc.WebaapProjectVPC.id

  ingress {
    description      = "allow_ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "allow_http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "DB_connection"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.WebaapProjectSG.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebaapProjectSG_database"
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.WebbappProject_ap-south-1b_private.id,aws_subnet.WebbappProject_ap-south-1b.id,aws_subnet.WebbappProject_ap-south-1a.id]
  
  tags = {
    Name = "My DB subnet"
  }
}

# Craeting Database for webaapp

resource "aws_db_instance" "webapp_database_instance" {
  allocated_storage    = 10
  db_name              = "mywebappdb"
  engine               = "mysql"
  engine_version       = "8.0.32"
  instance_class       = "db.t3.micro"
  username             = "admin123"
  password             = "admin123"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids = [ aws_security_group.WebaapProjectSG_Database.id ]
}*/