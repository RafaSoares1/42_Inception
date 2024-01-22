# Use the Debian Bullseye base image
FROM debian:bullseye

EXPOSE 9000

# Set TEMP environment variables for php configuration
ENV SQL_DATABASE="DataBaseMDB"
ENV SQL_USER="inception"
ENV SQL_ROOT_PASSWORD="12345"
ENV SQL_PASSWORD="123456"
ENV SQL_HOST="mariadb"


RUN apt update
RUN apt upgrade -y

# Install necessary packages
RUN apt-get install -y --no-install-recommends \
    php7.3 php7.3-fpm php7.3-mysql mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
WORKDIR /var/www/html
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/wordpress/