data "template_file" "nginx_config" {
  template = file("nginx.conf.tpl")

  vars          = {
    listen_port = var.listen_port
    server_name = var.server_name
    proxy_port  = var.listen_port
  }
}

resource "local_file" "nginx_config" {
  content  = data.template_file.nginx_config.rendered
  filename = "/tmp/${var.projectname}.conf"
}
