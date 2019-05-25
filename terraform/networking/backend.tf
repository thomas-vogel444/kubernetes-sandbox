terraform {
    backend "s3" {
        bucket = "thomas-vogel444-terraform-remote-state-storage-s3"
        region = "eu-west-1"
        key = "kubernetes-sandbox/networking.tfstate"
        encrypt = "true"
        acl = "bucket-owner-full-control"
        profile = "personal"
    }
}