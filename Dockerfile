FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY req.txt /app/req.txt
RUN pip install --no-cache-dir -r /app/req.txt flask gunicorn

COPY . /app

WORKDIR /app/server

EXPOSE 5000

CMD ["sh", "-c", "[ -f server_config.json ] || cp server_config.dist server_config.json; python retibbs_server.py --config-file server_config.json --identity-file server_identity.pem"]
