##terraform.tfvars##
#This is a example using maps variable on tfvars file for different environments (prod and dev), using lookup to "look" and add two variables in one string, searching in a list "type map"#
container_name = { 
    dev = "dev_blog"
    prod = "prod_blog"
}

image = {
    dev = "ghost:latest"
    prod = "ghost:alpine"
}

int_port = {
    dev = "2368"
    prod = 2368
}

ext_port = { 
dev = "8080"
prod = "8080"
}

##variables.tf##
variable env {
  description = Enter environment, dev or prod"
}

variable "container_name" {
  description = "Name of container"
  type = "map"
}

variable "image" {
  description = "image for container"
  type = "map"
}

variable "int_port" {
  description = "internal port for container"
  type = "map"
}

variable "ext_port" {
  description = "external port for container"
  type = "map"
}

##main.tf###

module "image" {
  source = "./image"
  image  = "${lookup(var.image, var.env)}"
}

# Start the Container
module "container" {
  source   = "./container"
  image    = "${module.image.image_out}"
  name     = "${lookup (var.container_name, var.env)}"
  int_port = "${lookup (var.int_port, var.env)}"
  ext_port = "${lookup(var.ext_port, var.env}"
}


