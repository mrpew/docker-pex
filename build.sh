#!/bin/env bash

REPO=${DOCKER_REPO:-mrpew/pex}
PYTHON_VERSIONS=(
    "3.8"
    "3.10"
    "3.11"
    "3.12"
)

function build_images {
    for py in "${PYTHON_VERSIONS[@]}"
    do
      sudo docker build . -t ${REPO}:${py} --build-arg PYTHON_VERSION="${py}"
    done
}

function push_images {
    for py in "${PYTHON_VERSIONS[@]}"
    do
      sudo docker push "${REPO}:${py}"
    done
}

case "$1" in
    build)
        build_images
        ;;
    push)
        push_images
        ;;
    bush)
        build_images
        push_images
        ;;
    *)
        echo "${0}: invalid argument ${1}"
        echo "     build => build images"
        echo "     push  => push images"
        echo "     bush  => .. both"
        echo "     set target repository via DOCKER_REPO env var"
        ;;
esac