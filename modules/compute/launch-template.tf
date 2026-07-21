resource "aws_launch_template" "this" {
  name_prefix = "${var.project_name}-${var.environment}-"
  image_id = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [ var.security_group_id ]
  instance_type = var.instance_type
  user_data = base64encode(
    templatefile("${path.module}/user_data.tpl", {
    environment = var.environment
    project_name = var.project_name
    }
    )
  )
  tag_specifications {
    resource_type = "instance"
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-apache"
        }
    )
  }
}