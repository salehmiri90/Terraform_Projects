server {
  listen ${ listen_port } ssl;
  server_name ${ server_name };

  ssl_certificate /etc/ssl/certs/myco.pem;
  ssl_certificate_key /etc/ssl/private/myco.key;

  client_max_body_size 640M;

  location / {
    proxy_pass http://127.0.0.1:${ proxy_port };
  }
}

