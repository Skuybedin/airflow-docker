#!/bin/bash

# Создание БД
sleep 10
airflow db init
sleep 10

#Создание пользователя
airflow users create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin

# Запуск шедулера и вебсервера
sleep 10
airflow scheduler & airflow webserver