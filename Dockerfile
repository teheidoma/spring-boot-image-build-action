FROM ghcr.io/teheidoma/spring-boot-image-build-action:test

COPY entrypoint.py /entrypoint.py

ENTRYPOINT ["python", "/entrypoint.py"]
