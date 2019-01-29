# storage/output.tf#

output "bucketname" {
  value = "${aws_s3_bucket.tf_code.id}"
}

#root/output.tf - About output.tf in root folder#
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}
