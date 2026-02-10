resource "local_file" "ansible-inventory-file-yaml" {
  content = templatefile("publicservers_yaml.tpl",
    {

      testserver01    = aws_instance.webserver.0.public_ip
      testserver02    = aws_instance.webserver.1.public_ip
      testserver03    = aws_instance.webserver.2.public_ip
      pvttestserver01 = aws_instance.webserver.0.private_ip
      pvttestserver02 = aws_instance.webserver.1.private_ip
      pvttestserver03 = aws_instance.webserver.2.private_ip
    }
  )
  filename = "${path.module}/invfile.yaml"
}
