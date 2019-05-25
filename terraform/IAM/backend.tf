provider "aws" {
    profile = "personal"
    region = "eu-west-1"
}


terraform {
    backend "s3" {
        bucket = "thomas-vogel444-terraform-remote-state-storage-s3"
        key = "kubernetes-sandbox/iam.tfstate"
        region = "eu-west-1"
        profile = "personal"
    }
}