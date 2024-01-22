FROM debian:bullseye
EXPOSE 3306

ENV SQL_DATABASE="DataBaseMDB"
ENV SQL_USER="inception"
ENV SQL_ROOT_PASSWORD="12345"
ENV SQL_PASSWORD="123456"

# Install MariaDB
RUN	apt update && \
	apt install -y --no-install-recommends --no-install-suggests \
	mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	tools/script.sh /bin/
RUN	chmod +x /bin/script.sh


ENTRYPOINT [ "sh", "/bin/script.sh" ]