# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the containerr
WORKDIR /app
COPY . /app

# install required packages for system
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install app dependencies
RUN pip install mysqlclient
RUN pip install -r requirements.txt

# Specify the command to run your application
CMD ["python", "app.py"]
