#!/usr/bin/env bash
# fail script immediately on any errors in external commands and print the lines
set -ev

cd $1
docker-compose up -d
