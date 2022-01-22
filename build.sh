#!/bin/bash

if [ ! -d "public" ]; then
    mkdir -p "public"
fi

./scripts/generate_thumbnails.sh
./scripts/generate_mediums.sh
./scripts/generate_webp.sh
./scripts/generate_maps_page.sh
./scripts/generate_json.sh

mv images public/
