FROM python:3.10

ARG AIRFLOW_VERSION=2.6.3
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

RUN pip install apache-airflow[postgres]==${AIRFLOW_VERSION}
RUN pip install SQLAlchemy

RUN mkdir /project

COPY scripts/ /project/scripts/
COPY config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN chmod +x /project/scripts/init.sh

ENTRYPOINT ["/project/scripts/init.sh"]