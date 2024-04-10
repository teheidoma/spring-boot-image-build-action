# Spring boot image build action

This action will build your spring application via 'bootBuildImage' and publish it ! hooray

## Inputs

## `jdk-dist`

**Required** Jdk dist used to build an image, obtained from SDKMAN.
Aviable jdks you can find here https://sdkman.io/jdks or using `sdk ls java`
Default `22-graal`.

## Example usage

```yaml
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    name: test
    steps:
      - uses: actions/checkout@v4
      - name: Spring boot image build
        uses: teheidoma/spring-boot-image-build-action@0.0.2

```
