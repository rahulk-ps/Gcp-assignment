terraform {
  backend "gcs" {
    bucket = "burner-rahkumar49-terraform-state"
    prefix = "terraform/state"
  }
}