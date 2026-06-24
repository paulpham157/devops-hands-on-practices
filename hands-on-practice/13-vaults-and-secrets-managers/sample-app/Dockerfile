FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN groupadd --system app \
    && useradd --system --gid app --home-dir /app app

COPY app.py .

USER app

EXPOSE 8080

CMD ["python", "app.py"]
