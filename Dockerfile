FROM node:22.12.0 AS builder

WORKDIR /app
COPY package.json yarn.lock ./

RUN yarn global add vite
RUN yarn install
COPY . .
RUN yarn build

# Use Nginx as the production server
FROM nginx:1.27-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]