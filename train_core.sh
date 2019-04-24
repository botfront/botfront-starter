#!/usr/bin/env bash
echo "Training model..."
# Get env variables from 'local.env' file
export $(cat local.env | grep -v ^# | xargs)
# not removing first provokes a "resource unavailable" error on the folder when persisting
rm -rf models/core/*
docker-compose stop core
# train
docker-compose run core train \
    -s project/stories/ \
    -d project/domains/domain.yml \
    -c project/policies.yml \
    -o model

# Zip model to upload
cd models/core
zip -r model-$(date -u +"%Y-%m-%dT%H:%M:%SZ").zip *
cd ..
docker-compose start core