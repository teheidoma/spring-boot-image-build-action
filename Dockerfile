FROM ubuntu

RUN apt update \
    && apt install -y bash curl git zip docker.io \
    && curl -s "https://get.sdkman.io" | bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
