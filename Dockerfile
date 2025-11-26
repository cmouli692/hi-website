# Step 1 - Build React App
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
Copy . .
RUN npm run build

# Step 2 - Serve using NGINX
FROM nginx:alpine
COPY --from=builder /app/dist / usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]