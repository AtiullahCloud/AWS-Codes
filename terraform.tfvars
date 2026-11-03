ec2_config = [
  {
    ami           = "ami-0b6d9d3d33ba97d99" # ubuntu
    instance_type = "t3.micro"
  },
  {
    ami           = "ami-052387465d846f3fc" # amazon linux
    instance_type = "t3.micro"
  },
  {
    ami           = "ami-00adafae70b8029d8" # linux
    instance_type = "t3.micro"
  }
]

ec2_map = {
  "ubuntu" = {
    ami           = "ami-0b6d9d3d33ba97d99"
    instance_type = "t3.micro"
  }

  "amazon-linux" = {
    ami           = "ami-0bd3fbcdc633a1b1a"
    instance_type = "t3.micro"
  }

  "linux" = {
    ami           = "ami-00adafae70b8029d8"
    instance_type = "t3.micro"
  }
}