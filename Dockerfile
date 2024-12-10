FROM rasa/rasa:latest

COPY . /app
WORKDIR /app

USER root
RUN pip install --no-cache-dir --upgrade pip==24.3.1

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
USER 1001

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 5005

CMD ["bash", "/app/start.sh"]