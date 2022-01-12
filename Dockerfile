FROM    debian:stable-slim
WORKDIR /opt/
COPY init.sh init.sh
RUN     apt-get update -y && \
        apt-get install -y git curl mlocate vim nano wget procps iputils-ping traceroute net-tools iproute2 mosquitto-clients netcat && \
        curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
        apt-get install -y nodejs && \
	chmod +x init.sh
ENTRYPOINT ["/opt/init.sh"]
CMD ["node","app.js"]
