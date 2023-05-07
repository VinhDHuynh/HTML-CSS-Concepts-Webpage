FROM nginx:latest

RUN apt-get update && apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=CA/L=San Francisco/O=Example Inc/CN=example.com" -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

COPY nginx.conf /etc/nginx/conf.d/
COPY ./HTML-CSS-Concepts-Webpage /var/www/html

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]