FROM nginx

RUN apt-get update \
  && apt-get install -y make git \
  && rm -rf /var/lib/apt/lists/*

COPY default.conf.template /etc/nginx/conf.d/

CMD ["/bin/bash", "-c", "envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
