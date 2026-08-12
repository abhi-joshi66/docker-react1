FROM node:16-alpine as builder

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

RUN ["npm", "build"]

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

