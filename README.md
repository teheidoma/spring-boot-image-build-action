# Spring Boot Image Build Action

![Spring Boot Image Build Action](https://img.shields.io/badge/Spring%20Boot%20Image%20Build-green?logo=arrow-up-circle)

This action builds your Spring application using 'bootBuildImage' and publishes it.

## Inputs

- `jdk_dist` (required): JDK distribution. Default is '22-graal'.
- `registry_username`: Registry username.
- `registry_password`: Registry password.
- `registry_hostname`: Registry hostname. Default is 'docker.io'.
- `include_commit_sha`: Include commit SHA to image tag. Default is 'false'.

## Outputs

- `tag`: Image name.
- `image_tag`: Image tag.

## Example Usage

```yaml
name: Build and Publish Spring Boot Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Build Spring Boot Image
        id: build
        uses: username/repo-name@v1
        with:
          jdk_dist: '17.0.10-graal'
          registry_username: ${{ secrets.REGISTRY_USERNAME }}
          registry_password: ${{ secrets.REGISTRY_PASSWORD }}
          registry_hostname: 'docker.io'
          include_commit_sha: 'true'
      - name: Upload Image to Registry
        run: echo "Upload image ${{ steps.build.outputs.tag }}:${{ steps.build.outputs.image_tag }} to registry."
