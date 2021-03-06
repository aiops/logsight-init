# docker build -t logsight/logsight-result-api .

# set base image (host OS)
FROM python:3.9-slim

ENV LDFLAGS="-L/usr/lib/x86_64-linux-gnu"
ENV CFLAGS="-I/usr/include"

# set the working directory in the container
WORKDIR /code
COPY ./main.py .
# install dependencies
RUN pip install logsight-sdk-py
#
## copy code
#COPY ../logsight-verification-action .
#COPY ../logsight-verification-action/entrypoint.sh /
#RUN chmod +x /entrypoint.sh
#
## Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["python3", "./main.py"]