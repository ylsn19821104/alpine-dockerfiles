FROM alpine:latest
MAINTAINER niuyuxian <"ncc0706@gmail.com">

ENV TZ Asia/Shanghai

ENV NGINX_VERSION 1.10.1

# 国内镜像
#RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main\n" > /etc/apk/repositories

RUN apk --update add tzdata \
	&& cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN addgroup -g 499 -S nginx \
    && adduser -HDu 499 -s /sbin/nologin -g 'web server' -G nginx nginx \
    && apk --update add make gcc g++ zlib zlib-dev build-base ca-certificates linux-headers openssl openssl-dev pcre pcre-dev \
    && cd /tmp \
    && wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz \
    && tar xzf nginx-$NGINX_VERSION.tar.gz \
#    && rm -rf nginx-$NGINX_VERSION.tar.gz \
    && echo "Hello" \
    && echo $PWD \
    && cd nginx-$NGINX_VERSION \
    && echo $PWD \
    && ls -al \
    && echo "Hello2" \
    ./configure \
    --prefix=/usr/local/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --user=nginx \
    --group=nginx \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_gzip_static_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --http-client-body-temp-path=/var/tmp/nginx/client \
    --http-proxy-temp-path=/var/tmp/nginx/proxy \
    --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
    --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
    && make && make install \
    && mkdir -p /var/tmp/nginx/{client,fastcgi,proxy,uwsgi} \
    && echo "daemon off;" >> /etc/nginx/ngnix.conf
#    && apk del wget \
#    && rm -rf /var/cache/apk/* /tmp/*

ENV PATH /usr/local/nginx/sbin:$PATH
EXPOSE 80

CMD ["/usr/local/nginx/sbin/nginx"]