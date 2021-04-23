FROM python:3.9.2-slim-buster


RUN apt update -y && \
    apt install -y   \
      python3-pip    \
      openssh-client \
      sshpass

WORKDIR /usr/src

COPY requirements.txt .
COPY requirements.yml .
RUN pip3 install -r requirements.txt
RUN ansible-galaxy install -r requirements.yml
