ARG version="3.6-alpine"
FROM python
LABEL maintainer="Hrubech HOMBESSA"

WORKDIR /opt
RUN apt-get update \
    && apt-get install --no-install-recommends -y git \
    && git clone https://github.com/eazytraining/projet-fils-rouge.git /opt/ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -r jenkins-tools releases.txt Readme.md *.pdf \
    && pip3 install flask

ENV ODOO_URL="odoo.com"
ENV PGADMIN_URL="pgadmin.com"

EXPOSE 8080

ENTRYPOINT [ "python", "app.py" ]