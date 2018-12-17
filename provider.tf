provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_KEY_ID}"
  region     = "${var.AWS_REGION}"
}
