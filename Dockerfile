# Pull base image 
FROM nginx:latest
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "less"]
RUN ["apt-get", "install", "-y", "telnet"]

# Maintainer 
MAINTAINER "harlandclarke" 

# Copy to nginx 
ADD nginx.conf /etc/nginx/nginx.conf
ADD proxy.conf /etc/nginx/conf.d/default.conf
ADD certs /etc/nginx/certs
