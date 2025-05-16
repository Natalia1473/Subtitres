FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y ffmpeg git build-essential imagemagick libsm6 libxext6 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip list  # <--- ДАСТ ЛОГ

COPY . .

CMD ["python", "main.py"]
