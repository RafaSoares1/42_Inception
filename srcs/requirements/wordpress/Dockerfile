# Use the Debian Bullseye base image
FROM debian:bullseye

EXPOSE 9000

# Set TEMP environment variables for php configuration
#ENV SQL_DATABASE="DataBaseMDB"
#ENV SQL_USER="inception"
#ENV SQL_ROOT_PASSWORD="12345"
#ENV SQL_PASSWORD="123456"
#ENV SQL_HOST="mariadb"
#ENV WP_DOMAIN_NAME="emsoares.42.fr"
#ENV WP_TITLE="inception"
#ENV WP_ADMIN_USER="root"
#ENV WP_ADMIN_PASSWORD="12345"
#ENV WP_ADMIN_EMAIL="root@123.com"
#ENV WP_USER="user"
#ENV WP_USER_EMAIL="user@123.com"
#ENV WP_USER_PASSWORD="12345"


RUN apt update
RUN apt upgrade -y

# Install necessary packages
RUN apt-get install -y --no-install-recommends \
    php7.4 php-fpm php-mysql mariadb-client php7.4-mysql && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
WORKDIR /var/www/html
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget --no-check-certificate https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xzf wordpress-6.4.tar.gz && \
    rm wordpress-6.4.tar.gz


COPY ./conf/wp-config.php /var/www/wordpress/

RUN mkdir -p /run/php/
RUN chown -R www-data:www-data /run/php/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Configure wordpress using wp cli
RUN wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp_script.sh /tmp/

ENTRYPOINT [ "sh", "/tmp/wp_script.sh" ]