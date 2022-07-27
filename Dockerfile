FROM nginx:alpine as production-build
COPY ping.conf /etc/nginx/conf.d/default.conf
VOLUME "/etc/certs"

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
COPY dist /usr/share/nginx/html

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]