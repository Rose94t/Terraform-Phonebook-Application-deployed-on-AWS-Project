#! /bin/bash
yum update -y
yum install python3 -y
yum install pip -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
TOKEN=${user_data-git-name}
USER=${user_data-git-name}
cd /home/ec2-user && git clone https://$TOKEN@github.com/$USER/Terraform-Phonebook-Application-deployed-on-AWS-Project.git
python3 /home/ec2-user/Terraform-Phonebook-Application-deployed-on-AWS-Project/phonebook-app.py