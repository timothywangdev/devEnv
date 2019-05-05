#!/bin/bash

if [ ! -f "./tunnel" ]
then
  wget https://github.com/mmatczuk/go-http-tunnel/releases/download/2.1/tunnel_linux_amd64.tar.gz
  tar -xvf tunnel_linux_amd64.tar.gz
  rm tunnel_linux_amd64.tar.gz
  rm tunneld
fi
if [ ! -f "./client.crt" ]; then openssl req -x509 -nodes -newkey rsa:2048 -sha256 -keyout client.key -out client.crt; fi

echo -e "server_addr: 18.235.170.28:5223\ntunnels:\n  react:\n    proto: http\n    addr: localhost:3000\n    host: $1.serveo.ventureum.io" > .tunnel.yml
./tunnel -config ./.tunnel.yml start-all
