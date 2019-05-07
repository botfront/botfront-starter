#!/usr/bin/env bash
echo "Training core model..."
# not removing first provokes a "resource unavailable" error on the folder when persisting
rm -rf models/core/*
# train
docker run \
    -v /$(pwd)/models/core:/app/model \
    -v /$(pwd)/project:/app/project \
    -t botfront/rasa-core-bf train \
    -d project/domains/domain.yml \
    -o model \
    -s project/stories \
    -c project/policies.yml 

# Zip model to upload
cd models/core
zip -r model-$(date -u +"%Y-%m-%dT%H:%M:%SZ").zip *
cd ..