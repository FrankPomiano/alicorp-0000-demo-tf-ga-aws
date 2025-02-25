variable "AWS_TAGS" {
  type = map(string)
  default = {
    "Project Name"        = "alicorp-0000-demo"
    "Project Description" = "Esta demo presenta el despliegue mediante Github Action - Terraform - ECS Fargete"
    "Sector"              = "DevOps Engineer"
    "Company"             = "CORPORACION ROMERO GROUP"
    "Cost center"         = "0000"
  }
}

variable "VPC_CIDR_BLOCKS" {
  type = map(string)
  default = {
    dev = "192.168.0.0/16"
    qa  = "11.0.0.0/16"
    stg = "192.168.0.0/16"
    prd = "192.168.0.0/16"
  }
}

variable "PRIVATE_SUBNET_1A_CIDR_BLOCKS" {
  type = map(string)
  default = {
    dev = "192.168.0.0/24"
    qa  = "11.0.0.0/24"
    stg = "192.168.0.0/24"
    prd = "192.168.0.0/24"
  }
}
variable "PRIVATE_SUBNET_1B_CIDR_BLOCKS" {
  type = map(string)
  default = {
    dev = "192.168.1.0/24"
    qa  = "11.0.1.0/24"
    stg = "192.168.1.0/24"
    prd = "192.168.1.0/24"
  }
}

variable "PUBLIC_SUBNET_1A_CIDR_BLOCKS" {
  type = map(string)
  default = {
    dev = "192.168.3.0/24"
    qa  = "11.0.3.0/24"
    stg = "192.168.3.0/24"
    prd = "192.168.3.0/24"
  }
}
variable "PUBLIC_SUBNET_1B_CIDR_BLOCKS" {
  type = map(string)
  default = {
    dev = "192.168.4.0/24"
    qa  = "11.0.4.0/24"
    stg = "192.168.4.0/24"
    prd = "192.168.4.0/24"
  }
}

variable "CERTIFICATE_ARN" {
  type = map(string)
  default = {
    dev = "arn:aws:acm:us-east-2:917972781642:certificate/cd882c21-a6fa-47c5-b05e-019df1db2c6b"
    qa  = "arn:aws:acm:us-east-2:917972781642:certificate/cd882c21-a6fa-47c5-b05e-019df1db2c6b"
    stg = "arn:aws:acm:us-east-2:917972781642:certificate/cd882c21-a6fa-47c5-b05e-019df1db2c6b"
    prd = "arn:aws:acm:us-east-2:917972781642:certificate/cd882c21-a6fa-47c5-b05e-019df1db2c6b"
  }
}
variable "ROUTE_53_ZONE_ID" {
  type = map(string)
  default = {
    dev = "Z04108613LAO6VDZBN9J4"
    qa  = "Y04108613LAO6VDZBN9J2"
    stg = "Q04108613LAO6VDZBN9J7"
    prd = "B04108613LAO6VDZBN9J9"
  }
}
variable "DOMAIN_NAME_BACKEND" {
  type = map(string)
  default = {
    dev = "api.demo.cloudstudio.cloud"
    qa  = "api-qa.demo.cloudstudio.cloud"
    stg = "api-stg.demo.cloudstudio.cloud"
    prd = "api.demo.cloudstudio.cloud"
  }
}