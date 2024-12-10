FROM python:3.10.6-slim

COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 5005

CMD ["bash", "/app/start.sh"]