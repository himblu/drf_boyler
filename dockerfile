FROM python:3.13.5
#instal SSH Client
RUN apt-get update && apt-get install -y openssh-client

#set environment variables
ENV PYTHONUNBUFFERED 1

#set the working directory
WORKDIR /app

#Copy requirements.txt file
COPY requirements.txt /app/requirements.txt

#install python dependencies
RUN pip install -r  requirements.txt

#Copy the application to the working directory

COPY . /app

#start the SSH Tunnel
CMD python manage.py runserver 0.0.0.0:8000

