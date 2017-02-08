FROM ubuntu:16.04

MAINTAINER Simon Labrecque <simon@wegel.ca>

ENV VER_LIBTORRENT master
ENV VER_RTORRENT master

WORKDIR /usr/local/src

COPY *.sh *.diff /usr/local/src/
RUN /usr/local/src/1-install_build_deps.sh && \
	/usr/local/src/2-build_xmlrpc.sh && \
	/usr/local/src/3-build_libtorrent.sh && \
	/usr/local/src/4-build_rtorrent.sh && \
	/usr/local/src/5-install_rutorrent.sh && \
	/usr/local/src/6-install_nginx.sh && \
	/usr/local/src/7-install_runit.sh && \
	/usr/local/src/8-install_tini.sh && \
	/usr/local/src/9-cleanup.sh

COPY config/* /conf/
COPY service /etc/service
COPY entrypoint runsvdir-start /usr/sbin/

ENTRYPOINT ["/usr/sbin/entrypoint"]

# Declare ports to expose
EXPOSE 80

# Declare volumes
VOLUME ["/log", "/conf", "/data" ]
