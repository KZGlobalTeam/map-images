#!/bin/bash

MAPS_URL="http://kztimerglobal.com/api/v2.0/maps?is_validated=true&limit=9999"

API_MAPS=( $( curl -s "$MAPS_URL" | jq -r '.[].name' ) )
LOCAL_MAPS=( $( ls ./images | sed -e 's/\.jpg$//' ) )

# https://stackoverflow.com/a/28161520
API_DIFF=(`echo ${API_MAPS[@]} ${LOCAL_MAPS[@]} ${LOCAL_MAPS[@]} | tr ' ' '\n' | sort | uniq -u `)
LOCAL_DIFF=(`echo ${LOCAL_MAPS[@]} ${API_MAPS[@]} ${API_MAPS[@]} | tr ' ' '\n' | sort | uniq -u `)

echo "${API_DIFF[@]}" | tr ' ' '\n' > missingmaps.txt

echo "Finished"
echo "${#API_DIFF[@]} maps images of global maps unavailable (printed list above)"
echo "${#LOCAL_DIFF[@]} maps images are no longer global"