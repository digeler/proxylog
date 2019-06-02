FROM nginx
RUN apt-get update
WORKDIR /app
COPY cp.sh /app

