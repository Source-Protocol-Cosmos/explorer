# stage1 as builder
FROM node:16-alpine as builder

WORKDIR /vue-ui

# Copy the package.json and install dependencies
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install

# Copy rest of the files
COPY . .

# Build the project
RUN yarn run build


FROM nginx:alpine as production-build
COPY ping.conf /etc/nginx/nginx.conf
VOLUME "/etc/certs"

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
COPY --from=builder /vue-ui/dist /usr/share/nginx/html

EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]