FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

ENV TZ=Africa/Cairo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/nginx/nginx-pub.crt /etc/nginx/conf.d/nginx-pub.crt
COPY docker/nginx/nginx-key.key /etc/nginx/conf.d/nginx-key.key
COPY docker/nginx/password /etc/nginx/conf.d/password
COPY static/ /vol/web/static/