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
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: teheidoma/spring-boot-image-build-action@0.0.3
        with:
          jdk_dist: '17.0.10-graal'
          registry_username: ${{ secrets.REGISTRY_USERNAME }}
          registry_password: ${{ secrets.REGISTRY_PASSWORD }}
          registry_hostname: ${{ secrets.REGISTRY_HOSTNAME }}
          include_commit_sha: true
```
