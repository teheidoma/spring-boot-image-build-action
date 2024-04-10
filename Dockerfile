FROM ghcr.io/teheidoma/spring-boot-image-build-action:0.0.3

COPY entrypoint.py /entrypoint.py

ENTRYPOINT ["python", "/entrypoint.py"]
