FROM centos:8

LABEL maintainer="Bryan Pedini <b.pedini@bjphoster.com>"

RUN yum update -y && \
    yum install -y epel-release

RUN yum install -y nginx && \
    yum clean all

COPY nginx.conf /etc/nginx/nginx.conf
COPY site.conf /etc/nginx/conf.d/site.conf

CMD nginx
