resource "aws_launch_template" "launch_template" {
  name                = "launch_template"
  image_id           = data.aws_ssm_parameter.instance_ami.value
  instance_type      = var.instance_type
  
  network_interfaces {
    associate_public_ip_address = true
    security_groups            = [aws_security_group.instance_sg.id]
  }

  user_data = base64encode(file("userdata.sh"))
  key_name  = var.keyname
}