resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-1a"

    tags {
        Name = "main-public-1"
    }
}

#output "private_subnets" {
#  description = "List of IDs of private subnets"
#  value       = ["${module.vpc.private_subnets}"]
#}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}