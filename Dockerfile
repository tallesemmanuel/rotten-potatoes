FROM python:3.8-slim-buster
WORKDIR /app
COPY src/requirements.txt .
RUN pip install -r /app/requirements.txt
COPY src/ /app
EXPOSE 5000
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:5000", "-c", "config.py", "app:app"]