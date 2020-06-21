FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Copy the contents of "npm run build"
COPY --from=builder /app/build /usr/share/nginx/html