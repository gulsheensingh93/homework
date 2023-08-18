FROM python:3.7-slim

ARG USER="homework" 

RUN apt update && apt install sudo build-essential -y

RUN useradd -ms /bin/bash $USER && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

USER homework

COPY ./app/requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt && sudo rm -f /tmp/requirements.txt

COPY ./app/userapi.py /app/

CMD python /app/userapi.py