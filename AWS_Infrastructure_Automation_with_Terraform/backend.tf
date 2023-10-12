terraform {
  backend "s3" {
    bucket         = "dev-remote-state-bucketttt"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking"
  }
}