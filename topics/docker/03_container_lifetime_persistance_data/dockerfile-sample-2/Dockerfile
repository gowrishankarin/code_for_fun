# This shows how we can extend/change an existing official image from Dockerhub

FROM nginx:latest
# highly recommend you always pin versions for anything beyond dev/learn

WORKDIR /usr/share/nginx/html
# Change working directory to root to nginx webhost
# using WORKDIR is prefereed to using RUN cd

COPY index.html index.html
