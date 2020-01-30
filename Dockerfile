# start from base
FROM python:3.8-alpine

# install system-wide deps for python and node
RUN apk add gcc wget git musl-dev libffi-dev zlib libressl-dev make

# copy our application code
ADD . /opt/sophie_bot
WORKDIR /opt/sophie_bot

RUN rm -rf /opt/sophie_bot/data
RUN rm -rf /data

# Install pip
#RUN wget https://bootstrap.pypa.io/get-pip.py
#RUN python get-pip.py

# fetch app specific deps
RUN ls ./
RUN pip install -r requirements.txt

# start app
CMD [ "python", "-m", "sophie_bot" ]