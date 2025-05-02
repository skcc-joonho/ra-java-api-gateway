#!/bin/bash

# Set variables
IMAGE_NAME="api-gateway"
IMAGE_TAG="latest"
REGISTRY="agsats.azurecr.io"  # Docker Hub 또는 private registry URL

# Clean previous builds
echo "Cleaning previous builds..."
cd ..
rm -rf api-gateway/build

# Build the image from the root directory
echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f api-gateway/Dockerfile .

# Tag the image for registry
echo "Tagging image for registry..."
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

# ACR에 이미지 푸시
echo "Pushing image to ACR..."
docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

echo "Docker image build completed!" 