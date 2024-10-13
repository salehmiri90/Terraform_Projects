
resource "null_resource" "check_ports" {
  provisioner "local-exec" {
    command = <<EOT
      bash ${path.module}/check_available_ports.sh ${var.start_port} ${var.end_port} ${var.ssh_host}
    EOT
  }
}
