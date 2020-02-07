FROM centos:8

LABEL maintainer="Bryan Pedini <b.pedini@bjphoster.com>"

COPY conf/CentOS-AppStream.repo /etc/yum.repos.d/CentOS-AppStream.repo

RUN dnf makecache && \
    dnf install -y nginx && \
    dnf clean all

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/site.conf /etc/nginx/conf.d/site.conf
COPY site /site

CMD nginx
