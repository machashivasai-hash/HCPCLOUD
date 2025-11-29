resource "tls_private_key" "rsa-1678-example" {
  algorithm = "RSA"
  rsa_bits  = 1678
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.rsa-1678-example.private_key_pem
  filename = "AMAZONWEB.pem"
}
