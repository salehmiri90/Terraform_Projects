resource "null_resource" "upload_nginx_config" {

  provisioner "file" {
    source      = var.sourcefile
    destination = var.destination

    connection {
      type        = "ssh"
      host        = var.ssh_host
      user        = var.remote_user
      password    = var.remote_pass
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo nginx -s reload"
    ]

    connection {
      type        = "ssh"
      host        = var.ssh_host
      user        = var.remote_user
      password    = var.remote_pass
    }
  }
}
