FROM debian:9-slim
MAINTAINER Alex Chistyakov <alexclear@gmail.com>

RUN \
  cd / && apt-get update && apt-get install -y git zlib1g-dev curl gcc make libpcre3-dev && \
  curl -s -o /nginx-sources.tar.gz http://nginx.org/download/nginx-1.9.2.tar.gz && \
  tar xzf /nginx-sources.tar.gz && \
  git clone https://github.com/mailru/graphite-nginx-module.git && \
  cd /nginx-1.9.2 && patch -p1 < /graphite-nginx-module/graphite_module_v1_7_7.patch && \
  ./configure --add-module=/graphite-nginx-module && make && make install && \
  useradd -m nginx && \
  chown :nginx /usr/local/nginx && \
  chmod 0770 /usr/local/nginx && \
  rm -rf /nginx-1.9.2 && rm -rf /nginx-sources.tar.gz

EXPOSE 80
USER root

CMD /usr/local/nginx/sbin/nginx -g 'daemon off;'
