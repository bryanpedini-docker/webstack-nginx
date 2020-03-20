FROM centos:8

LABEL maintainer="Bryan Pedini <b.pedini@bjphoster.com>"

COPY data/conf/CentOS-AppStream.repo /etc/yum.repos.d/CentOS-AppStream.repo

RUN dnf makecache && \
    dnf install -y nginx && \
    dnf clean all

COPY data/conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY data/conf/nginx/site.conf /etc/nginx/conf.d/site.conf
COPY data/site /site

CMD nginx
