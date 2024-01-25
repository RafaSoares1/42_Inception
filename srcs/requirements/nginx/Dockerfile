FROM debian:bullseye

EXPOSE 443

ARG 42_USER
ARG DOMAIN_NAME
ARG NGINX_CRT
ARG NGINX_KEY

RUN apt update
RUN apt upgrade -y

RUN apt install nginx -y

#TSL
# Install TLS certificate
RUN mkdir -p /etc/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -sha256 -newkey rsa:4096  \
                -out $NGINX_CRT \
                -keyout $NGINX_KEY \
                -subj /C=PT/ST=Porto/L=Porto/O=42/OU=42Porto=$DOMAIN_NAME/UID=$42_USER

# Configure NGINX
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /tmp/
RUN envsubst '$NGINX_CRT $NGINX_KEY $DOMAIN_NAME' < /tmp/nginx.conf > /etc/nginx/nginx.conf
RUN cat /etc/nginx/nginx.conf
RUN rm /tmp/nginx.conf

# Set permissions to website
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]