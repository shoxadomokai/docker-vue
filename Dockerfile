FROM node:16-alpine3.13 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

