data "terraform_remote_state" "myremotestate" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.remote_state_key
    region = var.state_region
  }
}
