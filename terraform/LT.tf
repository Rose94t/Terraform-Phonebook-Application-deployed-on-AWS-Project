resource "aws_launch_template" "asg-lt" {
  name = "phonebook-lt"

  image_id = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name = var.key-name
  vpc_security_group_ids = [aws_security_group.server-sg.id]
  user_data = base64encode(data.template_file.Terraform-Phonebook-Application-deployed-on-AWS-Project.rendered)
  depends_on = [github_repository_file.dbendpoint]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Web Server of Phonebook App"
    }
  }
}