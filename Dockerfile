FROM leonardodutra/kettle-image:latest
MAINTAINER leo_dutra18@hotmail.com

ARG KETTLE_ENVIRONMENT
ENV KETTLE_ENVIRONMENT "$KETTLE_ENVIRONMENT"

RUN apt install dos2unix -y
RUN apt install python -y
RUN apt install python-pip python-dev build-essential ucspi-tcp -y

WORKDIR /app

ENV WORKSPACE /app
ENV JOB_PATH $WORKSPACE/src/main/kettle/MainFlow.kjb
ENV CONFIG_FILE $WORKSPACE/src/main/resources/config-$KETTLE_ENVIRONMENT.properties

COPY . /app

RUN mkdir -p /nonexistent/.pentaho/metastore
RUN mkdir -p /nonexistent/.kettle
RUN touch /nonexistent/.kettle/kettle.properties

RUN ln -s $WORKSPACE/start-$KETTLE_ENVIRONMENT.sh $WORKSPACE/job/job.sh
RUN chmod -R +x $WORKSPACE/job

RUN chmod +x /kettle/data-integration/spoon.sh
RUN chmod +x $WORKSPACE/start-$KETTLE_ENVIRONMENT.sh

RUN find $WORKSPACE -type f -print0 | xargs -0 dos2unix

EXPOSE 8080

# CMD tcpserver -v -P -R -H -l 0 0.0.0.0 8080 recordio /app/start-$KETTLE_ENVIRONMENT.sh
CMD python $WORKSPACE/server.py

