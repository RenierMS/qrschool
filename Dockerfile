FROM python:3.11.2
LABEL "maintainer"="Sebastian López Buritica <selobu at gamil dot com>"
COPY ./requirements.txt /var/www/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /var/www/requirements.txt
# COPY ./src/gunicorn_config.py  ./home/gunicorn_config.py
# COPY ./src ./home
WORKDIR /home
EXPOSE 8081
CMD ["gunicorn","-b 0.0.0.0:8081","--config", "gunicorn_config.py", "main:app"]
