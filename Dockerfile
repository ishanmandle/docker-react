FROM node:14-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm un build



FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

