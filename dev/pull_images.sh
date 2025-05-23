#!/bin/bash

# List of source images (e.g., from Docker Hub or other registries)
images=(
    "cuongopswat/go-coffeeshop-product"
    "cuongopswat/go-coffeeshop-counter"
    "cuongopswat/go-coffeeshop-kitchen"
    "cuongopswat/go-coffeeshop-barista"
    "cuongopswat/go-coffeeshop-proxy"
    "cuongopswat/go-coffeeshop-web"
    "cuongopswat/go-coffeeshop-web"
)
DOCKER_HUB_USER="leminhhuan72"

for image in "${images[@]}"; do
    echo "Pulling $image:latest"
    docker pull "$image:latest"

    image_name=$(basename "$image")
    new_image="$DOCKER_HUB_USER/$image_name:latest"

    echo "Tagging as $new_image"
    docker tag "$image:latest" "$new_image"

    echo "Pushing $new_image"
    docker push "$new_image"
done
