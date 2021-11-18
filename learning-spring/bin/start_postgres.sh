#!/usr/bin/env bash

set -euo pipefail
which psql > /dev/null || (echoerr "Please ensure that postgres client is in your PATH" && exit 1)

mkdir -p $HOME/docker/volumes/postgres
rm -rf $HOME/docker/volumes/postgres/data

docker run --rm --name pg-docker -e POSTGRES_PASSWORD=mypass -e POSTGRES_DB=mydb -d postgres -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql
sleep 3
export PGPASSWORD=postgres
psql -U myuser -W  -d mydb -h localhost -f schema.sql
psql -U myuser -W  -d mydb -h localhost -f data.sql

