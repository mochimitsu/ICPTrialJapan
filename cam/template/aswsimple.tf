#Availability Zones - Change it
variable "azs" {
   type        = "list"
   description = "インスタンスがデプロイされるAvailability Zoneのリスト"
   default     = [ "ap-northeast-1a", "ap-northeast-1c" ]
}

# AWS KeyName - Change it
variable "KeyPair_Name" {
   description  = "AWS キー・ペアの名前"
   default = "" 
}

variable "Public_SSHKey" {
   description  = "公開鍵を指定します"
   default = "" 
}

#Subnets - Change it
variable "Aws_Subnet" {
    description = "デプロイ先のサブネット"
    default     = [ "subnet-xxxxxxx", "subnet-xxxxxx" ]
}

variable "SecurityGroupID" {
    description = "Security Group ID"
    default =  [ "sg-7xxxxxxx" ]
}

variable "InstanceType" {
    description = "払出し先のインスタンスタイプ"
    default     = "t2.micro"
}




resource "aws_key_pair" "deployer" {
  key_name   = "${var.KeyPair_Name}"
  public_key = "${var.Public_SSHKey}"
}

resource "aws_instance" "web" {
  instance_type     = "${var.InstanceType}"
  count             = "1"
  availability_zone = "${element(var.azs,count.index)}"

  # Lookup the correct AMI based on the region we specified

  ami = "ami-eb50cd8d"

  # The name of our SSH keypair you've created and downloaded
  # from the AWS console.
  # https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs:
  key_name = "${aws_key_pair.deployer.key_name}"

  vpc_security_group_ids = "${var.SecurityGroupID}"

  user_data =  <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
myIP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
echo 'My IP ==>'$myIP
cat << EOFF > /var/www/html/index.html
<html>
<body>
<h1>Welcome to my Web Page</h1>
<hr/>
<p>MY IP:$myIP </p>
<hr/>
</body>
</html>
EOFF
EOF

  tags {
    Name = "instance-${count.index}"
  }
}

output "message" {
  value = "Instance is deployed Successfully !!" 
}
