# https://github.com/docker/labs/blob/master/beginner/static-site/Dockerfile

FROM nginx
ENV AUTHOR=Docker

WORKDIR /usr/share/nginx/html
COPY hello.html /usr/share/nginx/html/

CMD cd /usr/share/nginx/html && sed -e s/Docker/"$AUTHOR"/ hello.html > index.html ; nginx -g 'daemon off;'