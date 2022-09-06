FROM nginx

COPY ./_site/ /usr/share/nginx/html
COPY docker/nginx.conf /etc/nginx/nginx.conf