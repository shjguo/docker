##Dockerfile
ARG APP_VERSION=latest
FROM ubuntu:${APP_VERSION}

#Author / Owner of the Dockerfile
LABEL maintainer="taoziyoyo"

#Update the APT package repository
RUN apt-get update && apt-get upgrade -y

#Installing nginx packages
RUN apt-get install nginx  -y

RUN apt-get install iputils-ping -y
RUN ping -c3 google.com

#Nginx will run on the port 80
EXPOSE 80

#After creating the container , keep the nginx process UP and running in the Foreground
CMD ["nginx", "-g", "daemon off;"]
