#!/usr/bin/env bash
docker-compose ps -q | xargs docker stats