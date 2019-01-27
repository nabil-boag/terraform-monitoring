module "hello-world-service" {
  source          = "../../../modules/nginx-application"

  key_name         = "hello-world-serive-key"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  vpc_id           = "${var.vpc_id}"
  subnet_id        = "${var.subnet_id}"
}
