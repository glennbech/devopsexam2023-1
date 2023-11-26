FROM python:3.9-slim


WORKDIR /app


RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc


RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"


COPY app.py .
COPY requirements.txt .


RUN pip install --trusted-host pypi.python.org -r requirements.txt


CMD ["python", "app.py"]
