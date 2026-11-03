output "public_IP" {
description = "show me public IP of Instance"
value =  aws_instance.nginxserver.public_ip
}
output "instance_url" {
  description = "the url is access the nginx"

  value = "http://${aws_instance.nginxserver.public_ip}"
}