#!/bin/bash

# NGINX upstream should look like
# upstream backend_server {
#   server api:8000           fail_timeout=8s; # default was 10s
#   server backup_api:9000    backup;
# }

# First build or pull update docker image.
docker-compose build api;

# Spin up backup_api service and make sure there was no request failed while main service was down.
docker-compose up -d backup_api

# Then stop and up primary service
docker-compose stop api; docker-compose up -d api

# At last stop backup service
docker-compose stop backup_api;
