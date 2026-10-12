FROM python:3.12-slim

WORKDIR /app

COPY target/python /deps/openriak
COPY service/python-demo/src src/

RUN pip install --no-cache-dir /deps/openriak

CMD ["python", "src/main.py"]
