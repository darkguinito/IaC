FROM python:3.9.2-slim-buster


RUN apt-get update -y  \
    && apt-cache policy openssh-client sshpass \
    && apt-get install -y --no-install-recommends \
       python3-pip=18.1-5 \
       openssh-client=1:7.9p1-10+deb10u2 \
       sshpass=1.06-1 \
    && rm -rf /var/lib/apt/lists/*

 WORKDIR /usr/src

 COPY requirements.txt .
 COPY requirements.yml .
 RUN pip3 install --no-cache-dir -r requirements.txt && ansible-galaxy install -r requirements.yml
