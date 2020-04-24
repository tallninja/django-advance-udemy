FROM python:3.7-alpine
LABEL manintainer="Ernesto Cabana"
LABEL version="0.0.1"

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

# User to only run the app (Security)
RUN adduser -D user
USER user